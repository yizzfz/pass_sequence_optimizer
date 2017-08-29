; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2
  %indvars.iv13 = phi i64 [ 0, %2 ], [ %indvars.iv.next14, %18 ]
  %3 = trunc i64 %indvars.iv13 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph140, label %._crit_edge105

.lr.ph140:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph140.split.us.preheader, label %.lr.ph140.split.preheader

.lr.ph140.split.preheader:                        ; preds = %.lr.ph140
  %10 = add i32 %0, -1
  %xtraiter212 = and i32 %0, 3
  %lcmp.mod213 = icmp eq i32 %xtraiter212, 0
  br i1 %lcmp.mod213, label %.lr.ph140.split.prol.loopexit, label %.lr.ph140.split.prol.preheader

.lr.ph140.split.prol.preheader:                   ; preds = %.lr.ph140.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph140.split.prol

.lr.ph140.split.prol:                             ; preds = %.lr.ph140.split.prol.preheader, %.lr.ph140.split.prol
  %indvars.iv208.prol = phi i64 [ %indvars.iv.next209.prol, %.lr.ph140.split.prol ], [ 0, %.lr.ph140.split.prol.preheader ]
  %prol.iter214 = phi i32 [ %prol.iter214.sub, %.lr.ph140.split.prol ], [ %xtraiter212, %.lr.ph140.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv208.prol
  store double %11, double* %12, align 8
  %indvars.iv.next209.prol = add nuw nsw i64 %indvars.iv208.prol, 1
  %prol.iter214.sub = add i32 %prol.iter214, -1
  %prol.iter214.cmp = icmp eq i32 %prol.iter214.sub, 0
  br i1 %prol.iter214.cmp, label %.lr.ph140.split.prol.loopexit.loopexit, label %.lr.ph140.split.prol, !llvm.loop !1

.lr.ph140.split.prol.loopexit.loopexit:           ; preds = %.lr.ph140.split.prol
  br label %.lr.ph140.split.prol.loopexit

.lr.ph140.split.prol.loopexit:                    ; preds = %.lr.ph140.split.prol.loopexit.loopexit, %.lr.ph140.split.preheader
  %indvars.iv208.unr = phi i64 [ 0, %.lr.ph140.split.preheader ], [ %indvars.iv.next209.prol, %.lr.ph140.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph133, label %.lr.ph140.split.preheader220

.lr.ph140.split.preheader220:                     ; preds = %.lr.ph140.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %wide.trip.count210.3 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count210.3, -4
  %16 = sub i64 %15, %indvars.iv208.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 4
  br i1 %min.iters.check, label %.lr.ph140.split.preheader281, label %min.iters.checked

.lr.ph140.split.preheader281:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph140.split.preheader220
  %indvars.iv208.ph = phi i64 [ %indvars.iv208.unr, %min.iters.checked ], [ %indvars.iv208.unr, %.lr.ph140.split.preheader220 ], [ %ind.end, %middle.block ]
  br label %.lr.ph140.split

min.iters.checked:                                ; preds = %.lr.ph140.split.preheader220
  %n.mod.vf = and i64 %18, 3
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = shl nuw i64 %17, 2
  %20 = add i64 %indvars.iv208.unr, %19
  %21 = add i64 %20, 4
  %22 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph140.split.preheader281, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert262 = insertelement <2 x double> undef, double %14, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert262, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv208.unr, %23
  %24 = add nsw i64 %offset.idx, 3
  %25 = add i64 %offset.idx, 11
  %26 = getelementptr inbounds double, double* %5, i64 %24
  %27 = getelementptr inbounds double, double* %5, i64 %25
  %28 = getelementptr double, double* %26, i64 -3
  %29 = bitcast double* %28 to <8 x double>*
  %30 = getelementptr double, double* %27, i64 -3
  %31 = bitcast double* %30 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %29, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %31, align 8
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph140.split.preheader281

.lr.ph140.split.us.preheader:                     ; preds = %.lr.ph140
  %33 = add i32 %1, -1
  %xtraiter201 = and i32 %1, 3
  %wide.trip.count206 = zext i32 %0 to i64
  %wide.trip.count197.3 = zext i32 %1 to i64
  %34 = icmp eq i32 %xtraiter201, 0
  %35 = icmp ult i32 %33, 3
  %.pre = ptrtoint double* %5 to i64
  %sunkaddr225 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph140.split.us

.lr.ph140.split.us:                               ; preds = %._crit_edge137.us, %.lr.ph140.split.us.preheader
  %indvars.iv204 = phi i64 [ 0, %.lr.ph140.split.us.preheader ], [ %indvars.iv.next205, %._crit_edge137.us ]
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv204
  store double 0.000000e+00, double* %36, align 8
  br i1 %34, label %.prol.loopexit200, label %.prol.preheader199.preheader

.prol.preheader199.preheader:                     ; preds = %.lr.ph140.split.us
  %sunkaddr222 = shl i64 %indvars.iv204, 3
  %sunkaddr223 = add i64 %sunkaddr, %sunkaddr222
  %sunkaddr224 = inttoptr i64 %sunkaddr223 to double*
  br label %.prol.preheader199

.prol.preheader199:                               ; preds = %.prol.preheader199.preheader, %.prol.preheader199
  %indvars.iv195.prol = phi i64 [ %indvars.iv.next196.prol, %.prol.preheader199 ], [ 0, %.prol.preheader199.preheader ]
  %prol.iter203 = phi i32 [ %prol.iter203.sub, %.prol.preheader199 ], [ %xtraiter201, %.prol.preheader199.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv195.prol, i64 %indvars.iv204
  %38 = load double, double* %37, align 8
  %39 = load double, double* %sunkaddr224, align 8
  %40 = fadd double %38, %39
  store double %40, double* %sunkaddr224, align 8
  %indvars.iv.next196.prol = add nuw nsw i64 %indvars.iv195.prol, 1
  %prol.iter203.sub = add i32 %prol.iter203, -1
  %prol.iter203.cmp = icmp eq i32 %prol.iter203.sub, 0
  br i1 %prol.iter203.cmp, label %.prol.loopexit200.loopexit, label %.prol.preheader199, !llvm.loop !6

.prol.loopexit200.loopexit:                       ; preds = %.prol.preheader199
  br label %.prol.loopexit200

.prol.loopexit200:                                ; preds = %.prol.loopexit200.loopexit, %.lr.ph140.split.us
  %indvars.iv195.unr = phi i64 [ 0, %.lr.ph140.split.us ], [ %indvars.iv.next196.prol, %.prol.loopexit200.loopexit ]
  br i1 %35, label %.prol.loopexit200.._crit_edge137.us_crit_edge, label %.lr.ph140.split.us.new.preheader

.lr.ph140.split.us.new.preheader:                 ; preds = %.prol.loopexit200
  %sunkaddr226 = shl i64 %indvars.iv204, 3
  %sunkaddr227 = add i64 %sunkaddr225, %sunkaddr226
  %sunkaddr228 = inttoptr i64 %sunkaddr227 to double*
  br label %.lr.ph140.split.us.new

.prol.loopexit200.._crit_edge137.us_crit_edge:    ; preds = %.prol.loopexit200
  %.pre271 = shl i64 %indvars.iv204, 3
  %.pre272 = add i64 %.pre, %.pre271
  %.pre273 = inttoptr i64 %.pre272 to double*
  br label %._crit_edge137.us

.lr.ph140.split.us.new:                           ; preds = %.lr.ph140.split.us.new.preheader, %.lr.ph140.split.us.new
  %indvars.iv195 = phi i64 [ %indvars.iv.next196.3, %.lr.ph140.split.us.new ], [ %indvars.iv195.unr, %.lr.ph140.split.us.new.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv195, i64 %indvars.iv204
  %42 = load double, double* %41, align 8
  %43 = load double, double* %sunkaddr228, align 8
  %44 = fadd double %42, %43
  store double %44, double* %sunkaddr228, align 8
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next196, i64 %indvars.iv204
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %sunkaddr228, align 8
  %indvars.iv.next196.1 = add nsw i64 %indvars.iv195, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next196.1, i64 %indvars.iv204
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %sunkaddr228, align 8
  %indvars.iv.next196.2 = add nsw i64 %indvars.iv195, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next196.2, i64 %indvars.iv204
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %sunkaddr228, align 8
  %indvars.iv.next196.3 = add nsw i64 %indvars.iv195, 4
  %exitcond198.3 = icmp eq i64 %indvars.iv.next196.3, %wide.trip.count197.3
  br i1 %exitcond198.3, label %._crit_edge137.us.loopexit, label %.lr.ph140.split.us.new

._crit_edge137.us.loopexit:                       ; preds = %.lr.ph140.split.us.new
  br label %._crit_edge137.us

._crit_edge137.us:                                ; preds = %._crit_edge137.us.loopexit, %.prol.loopexit200.._crit_edge137.us_crit_edge
  %sunkaddr232.pre-phi = phi double* [ %.pre273, %.prol.loopexit200.._crit_edge137.us_crit_edge ], [ %sunkaddr228, %._crit_edge137.us.loopexit ]
  %54 = load double, double* %sunkaddr232.pre-phi, align 8
  %55 = fdiv double %54, %2
  store double %55, double* %sunkaddr232.pre-phi, align 8
  %indvars.iv.next205 = add nuw nsw i64 %indvars.iv204, 1
  %exitcond207 = icmp eq i64 %indvars.iv.next205, %wide.trip.count206
  br i1 %exitcond207, label %._crit_edge.loopexit, label %.lr.ph140.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge137.us
  br label %._crit_edge

._crit_edge.loopexit282:                          ; preds = %.lr.ph140.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit282, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph133, label %._crit_edge.._crit_edge105_crit_edge

._crit_edge.._crit_edge105_crit_edge:             ; preds = %._crit_edge
  br label %._crit_edge105

.lr.ph133:                                        ; preds = %.lr.ph140.split.prol.loopexit, %._crit_edge
  br i1 %9, label %.lr.ph133.split.us.preheader, label %.lr.ph133.split.preheader

.lr.ph133.split.us.preheader:                     ; preds = %.lr.ph133
  %xtraiter183 = and i32 %1, 1
  %wide.trip.count187 = zext i32 %0 to i64
  %wide.trip.count179.1 = zext i32 %1 to i64
  %56 = icmp eq i32 %xtraiter183, 0
  %57 = icmp eq i32 %1, 1
  %.pre274 = ptrtoint double* %6 to i64
  %sunkaddr241 = ptrtoint double* %5 to i64
  %sunkaddr245 = ptrtoint double* %6 to i64
  %sunkaddr233 = ptrtoint double* %5 to i64
  %sunkaddr237 = ptrtoint double* %6 to i64
  br label %.lr.ph133.split.us

.lr.ph133.split.preheader:                        ; preds = %.lr.ph133
  %xtraiter193 = and i32 %0, 1
  %lcmp.mod194 = icmp eq i32 %xtraiter193, 0
  br i1 %lcmp.mod194, label %.lr.ph133.split.prol.loopexit, label %.lr.ph133.split.prol

.lr.ph133.split.prol:                             ; preds = %.lr.ph133.split.preheader
  %58 = fdiv double 0.000000e+00, %2
  store double %58, double* %6, align 8
  %59 = tail call double @sqrt(double %58) #4
  %60 = fcmp ole double %59, 1.000000e-01
  %61 = select i1 %60, double 1.000000e+00, double %59
  store double %61, double* %6, align 8
  br label %.lr.ph133.split.prol.loopexit

.lr.ph133.split.prol.loopexit:                    ; preds = %.lr.ph133.split.preheader, %.lr.ph133.split.prol
  %indvars.iv189.unr = phi i64 [ 0, %.lr.ph133.split.preheader ], [ 1, %.lr.ph133.split.prol ]
  %62 = icmp eq i32 %0, 1
  br i1 %62, label %._crit_edge105, label %.lr.ph133.split.preheader218

.lr.ph133.split.preheader218:                     ; preds = %.lr.ph133.split.prol.loopexit
  %63 = fdiv double 0.000000e+00, %2
  %wide.trip.count191.1 = zext i32 %0 to i64
  br label %.lr.ph133.split

.lr.ph133.split.us:                               ; preds = %.lr.ph133.split.us.preheader, %._crit_edge131.us
  %indvars.iv185 = phi i64 [ %indvars.iv.next186, %._crit_edge131.us ], [ 0, %.lr.ph133.split.us.preheader ]
  %64 = getelementptr inbounds double, double* %6, i64 %indvars.iv185
  store double 0.000000e+00, double* %64, align 8
  br i1 %56, label %.prol.loopexit182, label %.prol.preheader181

.prol.preheader181:                               ; preds = %.lr.ph133.split.us
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv185
  %66 = load double, double* %65, align 8
  %sunkaddr234 = shl i64 %indvars.iv185, 3
  %sunkaddr235 = add i64 %sunkaddr233, %sunkaddr234
  %sunkaddr236 = inttoptr i64 %sunkaddr235 to double*
  %67 = load double, double* %sunkaddr236, align 8
  %68 = fsub double %66, %67
  %69 = fmul double %68, %68
  %sunkaddr239 = add i64 %sunkaddr237, %sunkaddr234
  %sunkaddr240 = inttoptr i64 %sunkaddr239 to double*
  %70 = load double, double* %sunkaddr240, align 8
  %71 = fadd double %70, %69
  store double %71, double* %sunkaddr240, align 8
  br label %.prol.loopexit182

.prol.loopexit182:                                ; preds = %.prol.preheader181, %.lr.ph133.split.us
  %indvars.iv177.unr.ph = phi i64 [ 1, %.prol.preheader181 ], [ 0, %.lr.ph133.split.us ]
  br i1 %57, label %.prol.loopexit182.._crit_edge131.us_crit_edge, label %.lr.ph133.split.us.new.preheader

.lr.ph133.split.us.new.preheader:                 ; preds = %.prol.loopexit182
  %sunkaddr242 = shl i64 %indvars.iv185, 3
  %sunkaddr243 = add i64 %sunkaddr241, %sunkaddr242
  %sunkaddr244 = inttoptr i64 %sunkaddr243 to double*
  %sunkaddr247 = add i64 %sunkaddr245, %sunkaddr242
  %sunkaddr248 = inttoptr i64 %sunkaddr247 to double*
  br label %.lr.ph133.split.us.new

.prol.loopexit182.._crit_edge131.us_crit_edge:    ; preds = %.prol.loopexit182
  %.pre275 = shl i64 %indvars.iv185, 3
  %.pre276 = add i64 %.pre274, %.pre275
  %.pre277 = inttoptr i64 %.pre276 to double*
  br label %._crit_edge131.us

.lr.ph133.split.us.new:                           ; preds = %.lr.ph133.split.us.new.preheader, %.lr.ph133.split.us.new
  %indvars.iv177 = phi i64 [ %indvars.iv.next178.1, %.lr.ph133.split.us.new ], [ %indvars.iv177.unr.ph, %.lr.ph133.split.us.new.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv177, i64 %indvars.iv185
  %73 = load double, double* %72, align 8
  %74 = load double, double* %sunkaddr244, align 8
  %75 = fsub double %73, %74
  %76 = fmul double %75, %75
  %77 = load double, double* %sunkaddr248, align 8
  %78 = fadd double %77, %76
  store double %78, double* %sunkaddr248, align 8
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next178, i64 %indvars.iv185
  %80 = load double, double* %79, align 8
  %81 = load double, double* %sunkaddr244, align 8
  %82 = fsub double %80, %81
  %83 = fmul double %82, %82
  %84 = fadd double %78, %83
  store double %84, double* %sunkaddr248, align 8
  %indvars.iv.next178.1 = add nsw i64 %indvars.iv177, 2
  %exitcond180.1 = icmp eq i64 %indvars.iv.next178.1, %wide.trip.count179.1
  br i1 %exitcond180.1, label %._crit_edge131.us.loopexit, label %.lr.ph133.split.us.new

._crit_edge131.us.loopexit:                       ; preds = %.lr.ph133.split.us.new
  br label %._crit_edge131.us

._crit_edge131.us:                                ; preds = %._crit_edge131.us.loopexit, %.prol.loopexit182.._crit_edge131.us_crit_edge
  %sunkaddr252.pre-phi = phi double* [ %.pre277, %.prol.loopexit182.._crit_edge131.us_crit_edge ], [ %sunkaddr248, %._crit_edge131.us.loopexit ]
  %85 = load double, double* %sunkaddr252.pre-phi, align 8
  %86 = fdiv double %85, %2
  store double %86, double* %sunkaddr252.pre-phi, align 8
  %87 = tail call double @sqrt(double %86) #4
  %88 = fcmp ole double %87, 1.000000e-01
  %89 = select i1 %88, double 1.000000e+00, double %87
  store double %89, double* %sunkaddr252.pre-phi, align 8
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond188 = icmp eq i64 %indvars.iv.next186, %wide.trip.count187
  br i1 %exitcond188, label %._crit_edge105.loopexit, label %.lr.ph133.split.us

.lr.ph140.split:                                  ; preds = %.lr.ph140.split.preheader281, %.lr.ph140.split
  %indvars.iv208 = phi i64 [ %indvars.iv.next209.3, %.lr.ph140.split ], [ %indvars.iv208.ph, %.lr.ph140.split.preheader281 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv208
  store double %14, double* %90, align 8
  %indvars.iv.next209 = add nuw nsw i64 %indvars.iv208, 1
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next209
  store double %14, double* %91, align 8
  %indvars.iv.next209.1 = add nsw i64 %indvars.iv208, 2
  %92 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next209.1
  store double %14, double* %92, align 8
  %indvars.iv.next209.2 = add nsw i64 %indvars.iv208, 3
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next209.2
  store double %14, double* %93, align 8
  %indvars.iv.next209.3 = add nsw i64 %indvars.iv208, 4
  %exitcond211.3 = icmp eq i64 %indvars.iv.next209.3, %wide.trip.count210.3
  br i1 %exitcond211.3, label %._crit_edge.loopexit282, label %.lr.ph140.split, !llvm.loop !7

._crit_edge105.loopexit:                          ; preds = %._crit_edge131.us
  br label %._crit_edge105

._crit_edge105.loopexit280:                       ; preds = %.lr.ph133.split
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.loopexit280, %._crit_edge105.loopexit, %._crit_edge.._crit_edge105_crit_edge, %7, %.lr.ph133.split.prol.loopexit
  %94 = icmp sgt i32 %1, 0
  br i1 %94, label %._crit_edge106.lr.ph, label %._crit_edge107

._crit_edge106.lr.ph:                             ; preds = %._crit_edge105
  br i1 %8, label %._crit_edge106.us.preheader, label %._crit_edge107.thread

._crit_edge106.us.preheader:                      ; preds = %._crit_edge106.lr.ph
  %wide.trip.count170 = zext i32 %0 to i64
  %wide.trip.count174 = zext i32 %1 to i64
  br label %._crit_edge106.us

._crit_edge107.thread:                            ; preds = %._crit_edge106.lr.ph
  %95 = add nsw i32 %0, -1
  br label %._crit_edge117

._crit_edge106.us:                                ; preds = %._crit_edge106.us.preheader, %._crit_edge126.us
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge126.us ], [ 0, %._crit_edge106.us.preheader ]
  br label %96

; <label>:96:                                     ; preds = %96, %._crit_edge106.us
  %indvars.iv168 = phi i64 [ 0, %._crit_edge106.us ], [ %indvars.iv.next169, %96 ]
  %97 = getelementptr inbounds double, double* %5, i64 %indvars.iv168
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv172, i64 %indvars.iv168
  %100 = load double, double* %99, align 8
  %101 = fsub double %100, %98
  store double %101, double* %99, align 8
  %102 = tail call double @sqrt(double %2) #4
  %103 = getelementptr inbounds double, double* %6, i64 %indvars.iv168
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = load double, double* %99, align 8
  %107 = fdiv double %106, %105
  store double %107, double* %99, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond171 = icmp eq i64 %indvars.iv.next169, %wide.trip.count170
  br i1 %exitcond171, label %._crit_edge126.us, label %96

._crit_edge126.us:                                ; preds = %96
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172, 1
  %exitcond175 = icmp eq i64 %indvars.iv.next173, %wide.trip.count174
  br i1 %exitcond175, label %._crit_edge107.loopexit, label %._crit_edge106.us

.lr.ph133.split:                                  ; preds = %.lr.ph133.split.preheader218, %.lr.ph133.split
  %indvars.iv189 = phi i64 [ %indvars.iv.next190.1, %.lr.ph133.split ], [ %indvars.iv189.unr, %.lr.ph133.split.preheader218 ]
  %108 = getelementptr inbounds double, double* %6, i64 %indvars.iv189
  store double %63, double* %108, align 8
  %109 = tail call double @sqrt(double %63) #4
  %110 = fcmp ole double %109, 1.000000e-01
  %111 = select i1 %110, double 1.000000e+00, double %109
  store double %111, double* %108, align 8
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %112 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next190
  store double %63, double* %112, align 8
  %113 = tail call double @sqrt(double %63) #4
  %114 = fcmp ole double %113, 1.000000e-01
  %115 = select i1 %114, double 1.000000e+00, double %113
  store double %115, double* %112, align 8
  %indvars.iv.next190.1 = add nsw i64 %indvars.iv189, 2
  %exitcond192.1 = icmp eq i64 %indvars.iv.next190.1, %wide.trip.count191.1
  br i1 %exitcond192.1, label %._crit_edge105.loopexit280, label %.lr.ph133.split

._crit_edge107.loopexit:                          ; preds = %._crit_edge126.us
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %._crit_edge105
  %116 = add nsw i32 %0, -1
  %117 = icmp sgt i32 %0, 1
  br i1 %117, label %.lr.ph116, label %._crit_edge117

.lr.ph116:                                        ; preds = %._crit_edge107
  br i1 %94, label %.lr.ph116.split.us.preheader, label %.lr.ph116.split.preheader

.lr.ph116.split.preheader:                        ; preds = %.lr.ph116
  %118 = zext i32 %116 to i64
  %119 = add i32 %0, -2
  %120 = zext i32 %119 to i64
  %121 = sext i32 %0 to i64
  %wide.trip.count159.3 = zext i32 %0 to i64
  br label %.lr.ph116.split

.lr.ph116.split.us.preheader:                     ; preds = %.lr.ph116
  %122 = sext i32 %0 to i64
  %wide.trip.count153 = zext i32 %116 to i64
  %xtraiter = and i32 %1, 1
  %wide.trip.count149 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %123 = icmp eq i32 %xtraiter, 0
  %124 = icmp eq i32 %1, 1
  %sunkaddr253 = ptrtoint [1200 x double]* %3 to i64
  br label %.lr.ph116.split.us

.lr.ph116.split.us:                               ; preds = %._crit_edge108.us, %.lr.ph116.split.us.preheader
  %indvars.iv151 = phi i64 [ 0, %.lr.ph116.split.us.preheader ], [ %indvars.iv.next152, %._crit_edge108.us ]
  %indvars.iv145 = phi i64 [ 1, %.lr.ph116.split.us.preheader ], [ %indvars.iv.next146, %._crit_edge108.us ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv151
  store double 1.000000e+00, double* %125, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %126 = icmp slt i64 %indvars.iv.next152, %122
  br i1 %126, label %.lr.ph.us.us.preheader, label %._crit_edge108.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph116.split.us
  %sunkaddr254 = shl i64 %indvars.iv151, 3
  %sunkaddr255 = add i64 %sunkaddr253, %sunkaddr254
  %sunkaddr256 = inttoptr i64 %sunkaddr255 to double*
  br label %.lr.ph.us.us

._crit_edge108.us.loopexit:                       ; preds = %._crit_edge111.us.us
  br label %._crit_edge108.us

._crit_edge108.us:                                ; preds = %._crit_edge108.us.loopexit, %.lr.ph116.split.us
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next152, %wide.trip.count153
  br i1 %exitcond154, label %._crit_edge117.loopexit, label %.lr.ph116.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge111.us.us
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge111.us.us ], [ %indvars.iv145, %.lr.ph.us.us.preheader ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv147
  store double 0.000000e+00, double* %127, align 8
  br i1 %123, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %128 = load double, double* %sunkaddr256, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv147
  %130 = load double, double* %129, align 8
  %131 = fmul double %128, %130
  %132 = fadd double %131, 0.000000e+00
  store double %132, double* %127, align 8
  %133 = bitcast double %132 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %134 = phi i64 [ %133, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %135 = phi double [ %132, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %124, label %._crit_edge111.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge111.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  %136 = bitcast double %152 to i64
  br label %._crit_edge111.us.us

._crit_edge111.us.us:                             ; preds = %._crit_edge111.us.us.loopexit, %.prol.loopexit
  %137 = phi i64 [ %134, %.prol.loopexit ], [ %136, %._crit_edge111.us.us.loopexit ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv147, i64 %indvars.iv151
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %exitcond = icmp eq i64 %indvars.iv.next148, %wide.trip.count149
  br i1 %exitcond, label %._crit_edge108.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %140 = phi double [ %152, %.lr.ph.us.us.new ], [ %135, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv151
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv147
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fadd double %140, %145
  store double %146, double* %127, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv151
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv147
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = fadd double %146, %151
  store double %152, double* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge111.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph116.split:                                  ; preds = %._crit_edge108, %.lr.ph116.split.preheader
  %indvars.iv164 = phi i64 [ 0, %.lr.ph116.split.preheader ], [ %indvars.iv.next165, %._crit_edge108 ]
  %indvars.iv155 = phi i64 [ 1, %.lr.ph116.split.preheader ], [ %indvars.iv.next156, %._crit_edge108 ]
  %153 = sub i64 %120, %indvars.iv164
  %154 = trunc i64 %153 to i32
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv164, i64 %indvars.iv164
  store double 1.000000e+00, double* %155, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %156 = icmp slt i64 %indvars.iv.next165, %121
  br i1 %156, label %.lr.ph114.split.preheader, label %._crit_edge108

.lr.ph114.split.preheader:                        ; preds = %.lr.ph116.split
  %157 = sub i64 %118, %indvars.iv164
  %158 = trunc i64 %157 to i32
  %xtraiter162 = and i32 %158, 3
  %lcmp.mod163 = icmp eq i32 %xtraiter162, 0
  br i1 %lcmp.mod163, label %.lr.ph114.split.prol.loopexit, label %.lr.ph114.split.prol.preheader

.lr.ph114.split.prol.preheader:                   ; preds = %.lr.ph114.split.preheader
  br label %.lr.ph114.split.prol

.lr.ph114.split.prol:                             ; preds = %.lr.ph114.split.prol.preheader, %.lr.ph114.split.prol
  %indvars.iv157.prol = phi i64 [ %indvars.iv.next158.prol, %.lr.ph114.split.prol ], [ %indvars.iv155, %.lr.ph114.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph114.split.prol ], [ %xtraiter162, %.lr.ph114.split.prol.preheader ]
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv164, i64 %indvars.iv157.prol
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv157.prol, i64 %indvars.iv164
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next158.prol = add nuw nsw i64 %indvars.iv157.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph114.split.prol.loopexit.loopexit, label %.lr.ph114.split.prol, !llvm.loop !9

.lr.ph114.split.prol.loopexit.loopexit:           ; preds = %.lr.ph114.split.prol
  br label %.lr.ph114.split.prol.loopexit

.lr.ph114.split.prol.loopexit:                    ; preds = %.lr.ph114.split.prol.loopexit.loopexit, %.lr.ph114.split.preheader
  %indvars.iv157.unr = phi i64 [ %indvars.iv155, %.lr.ph114.split.preheader ], [ %indvars.iv.next158.prol, %.lr.ph114.split.prol.loopexit.loopexit ]
  %162 = icmp ult i32 %154, 3
  br i1 %162, label %._crit_edge108, label %.lr.ph114.split.preheader278

.lr.ph114.split.preheader278:                     ; preds = %.lr.ph114.split.prol.loopexit
  br label %.lr.ph114.split

._crit_edge108.loopexit:                          ; preds = %.lr.ph114.split
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108.loopexit, %.lr.ph114.split.prol.loopexit, %.lr.ph116.split
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, %118
  br i1 %exitcond167, label %._crit_edge117.loopexit279, label %.lr.ph116.split

.lr.ph114.split:                                  ; preds = %.lr.ph114.split.preheader278, %.lr.ph114.split
  %indvars.iv157 = phi i64 [ %indvars.iv.next158.3, %.lr.ph114.split ], [ %indvars.iv157.unr, %.lr.ph114.split.preheader278 ]
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv164, i64 %indvars.iv157
  store double 0.000000e+00, double* %163, align 8
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv157, i64 %indvars.iv164
  %165 = bitcast double* %164 to i64*
  store i64 0, i64* %165, align 8
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv164, i64 %indvars.iv.next158
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next158, i64 %indvars.iv164
  %168 = bitcast double* %167 to i64*
  store i64 0, i64* %168, align 8
  %indvars.iv.next158.1 = add nsw i64 %indvars.iv157, 2
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv164, i64 %indvars.iv.next158.1
  store double 0.000000e+00, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next158.1, i64 %indvars.iv164
  %171 = bitcast double* %170 to i64*
  store i64 0, i64* %171, align 8
  %indvars.iv.next158.2 = add nsw i64 %indvars.iv157, 3
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv164, i64 %indvars.iv.next158.2
  store double 0.000000e+00, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next158.2, i64 %indvars.iv164
  %174 = bitcast double* %173 to i64*
  store i64 0, i64* %174, align 8
  %indvars.iv.next158.3 = add nsw i64 %indvars.iv157, 4
  %exitcond160.3 = icmp eq i64 %indvars.iv.next158.3, %wide.trip.count159.3
  br i1 %exitcond160.3, label %._crit_edge108.loopexit, label %.lr.ph114.split

._crit_edge117.loopexit:                          ; preds = %._crit_edge108.us
  br label %._crit_edge117

._crit_edge117.loopexit279:                       ; preds = %._crit_edge108
  br label %._crit_edge117

._crit_edge117:                                   ; preds = %._crit_edge117.loopexit279, %._crit_edge117.loopexit, %._crit_edge107.thread, %._crit_edge107
  %175 = phi i32 [ %95, %._crit_edge107.thread ], [ %116, %._crit_edge107 ], [ %116, %._crit_edge117.loopexit ], [ %116, %._crit_edge117.loopexit279 ]
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %176, i64 %176
  store double 1.000000e+00, double* %177, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge16

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge14.us, %._crit_edge.us.preheader
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next18, %._crit_edge14.us ]
  %9 = mul nsw i64 %indvars.iv17, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge12.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge12.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge12.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge14.us, label %10

._crit_edge14.us:                                 ; preds = %._crit_edge12.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count
  br i1 %exitcond20, label %._crit_edge16.loopexit, label %._crit_edge.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
