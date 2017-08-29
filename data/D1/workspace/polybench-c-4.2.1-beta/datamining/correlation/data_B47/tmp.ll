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

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv8 = phi i64 [ 0, %2 ], [ %indvars.iv.next9, %20 ]
  %3 = trunc i64 %indvars.iv8 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph137, label %._crit_edge89

.lr.ph137:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph137.split.us.preheader, label %.lr.ph137.split.preheader

.lr.ph137.split.preheader:                        ; preds = %.lr.ph137
  %10 = add i32 %0, -1
  %xtraiter213 = and i32 %0, 3
  %lcmp.mod214 = icmp eq i32 %xtraiter213, 0
  br i1 %lcmp.mod214, label %.lr.ph137.split.prol.loopexit, label %.lr.ph137.split.prol.preheader

.lr.ph137.split.prol.preheader:                   ; preds = %.lr.ph137.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph137.split.prol

.lr.ph137.split.prol:                             ; preds = %.lr.ph137.split.prol, %.lr.ph137.split.prol.preheader
  %indvars.iv209.prol = phi i64 [ %indvars.iv.next210.prol, %.lr.ph137.split.prol ], [ 0, %.lr.ph137.split.prol.preheader ]
  %prol.iter215 = phi i32 [ %prol.iter215.sub, %.lr.ph137.split.prol ], [ %xtraiter213, %.lr.ph137.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv209.prol
  store double %11, double* %12, align 8
  %indvars.iv.next210.prol = add nuw nsw i64 %indvars.iv209.prol, 1
  %prol.iter215.sub = add i32 %prol.iter215, -1
  %prol.iter215.cmp = icmp eq i32 %prol.iter215.sub, 0
  br i1 %prol.iter215.cmp, label %.lr.ph137.split.prol.loopexit.loopexit, label %.lr.ph137.split.prol, !llvm.loop !1

.lr.ph137.split.prol.loopexit.loopexit:           ; preds = %.lr.ph137.split.prol
  br label %.lr.ph137.split.prol.loopexit

.lr.ph137.split.prol.loopexit:                    ; preds = %.lr.ph137.split.prol.loopexit.loopexit, %.lr.ph137.split.preheader
  %indvars.iv209.unr = phi i64 [ 0, %.lr.ph137.split.preheader ], [ %indvars.iv.next210.prol, %.lr.ph137.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph129, label %.lr.ph137.split.preheader221

.lr.ph137.split.preheader221:                     ; preds = %.lr.ph137.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %wide.trip.count211.3 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count211.3, -4
  %16 = sub i64 %15, %indvars.iv209.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 4
  br i1 %min.iters.check, label %.lr.ph137.split.preheader247, label %min.iters.checked

.lr.ph137.split.preheader247:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph137.split.preheader221
  %indvars.iv209.ph = phi i64 [ %indvars.iv209.unr, %min.iters.checked ], [ %indvars.iv209.unr, %.lr.ph137.split.preheader221 ], [ %ind.end, %middle.block ]
  br label %.lr.ph137.split

min.iters.checked:                                ; preds = %.lr.ph137.split.preheader221
  %n.mod.vf = and i64 %18, 3
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = shl nuw i64 %17, 2
  %20 = add i64 %indvars.iv209.unr, %19
  %21 = add i64 %20, 4
  %22 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph137.split.preheader247, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert241 = insertelement <2 x double> undef, double %14, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert241, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv209.unr, %23
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
  br i1 %cmp.n, label %.lr.ph129, label %.lr.ph137.split.preheader247

.lr.ph137.split.us.preheader:                     ; preds = %.lr.ph137
  %33 = add i32 %1, -1
  %xtraiter201 = and i32 %1, 3
  %lcmp.mod202 = icmp eq i32 %xtraiter201, 0
  %34 = icmp ult i32 %33, 3
  %wide.trip.count207 = zext i32 %0 to i64
  %wide.trip.count197.3 = zext i32 %1 to i64
  br label %.lr.ph137.split.us

.lr.ph137.split.us:                               ; preds = %._crit_edge133.us, %.lr.ph137.split.us.preheader
  %indvars.iv205 = phi i64 [ 0, %.lr.ph137.split.us.preheader ], [ %indvars.iv.next206, %._crit_edge133.us ]
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv205
  store double 0.000000e+00, double* %35, align 8
  br i1 %lcmp.mod202, label %.prol.loopexit200, label %.prol.preheader199.preheader

.prol.preheader199.preheader:                     ; preds = %.lr.ph137.split.us
  br label %.prol.preheader199

.prol.preheader199:                               ; preds = %.prol.preheader199.preheader, %.prol.preheader199
  %indvars.iv195.prol = phi i64 [ %indvars.iv.next196.prol, %.prol.preheader199 ], [ 0, %.prol.preheader199.preheader ]
  %36 = phi double [ %39, %.prol.preheader199 ], [ 0.000000e+00, %.prol.preheader199.preheader ]
  %prol.iter203 = phi i32 [ %prol.iter203.sub, %.prol.preheader199 ], [ %xtraiter201, %.prol.preheader199.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv195.prol, i64 %indvars.iv205
  %38 = load double, double* %37, align 8
  %39 = fadd double %36, %38
  store double %39, double* %35, align 8
  %indvars.iv.next196.prol = add nuw nsw i64 %indvars.iv195.prol, 1
  %prol.iter203.sub = add i32 %prol.iter203, -1
  %prol.iter203.cmp = icmp eq i32 %prol.iter203.sub, 0
  br i1 %prol.iter203.cmp, label %.prol.loopexit200.loopexit, label %.prol.preheader199, !llvm.loop !6

.prol.loopexit200.loopexit:                       ; preds = %.prol.preheader199
  br label %.prol.loopexit200

.prol.loopexit200:                                ; preds = %.prol.loopexit200.loopexit, %.lr.ph137.split.us
  %indvars.iv195.unr = phi i64 [ 0, %.lr.ph137.split.us ], [ %indvars.iv.next196.prol, %.prol.loopexit200.loopexit ]
  %.unr204 = phi double [ 0.000000e+00, %.lr.ph137.split.us ], [ %39, %.prol.loopexit200.loopexit ]
  %.lcssa143.unr = phi double [ undef, %.lr.ph137.split.us ], [ %39, %.prol.loopexit200.loopexit ]
  br i1 %34, label %._crit_edge133.us, label %.lr.ph137.split.us.new.preheader

.lr.ph137.split.us.new.preheader:                 ; preds = %.prol.loopexit200
  br label %.lr.ph137.split.us.new

.lr.ph137.split.us.new:                           ; preds = %.lr.ph137.split.us.new.preheader, %.lr.ph137.split.us.new
  %indvars.iv195 = phi i64 [ %indvars.iv.next196.3, %.lr.ph137.split.us.new ], [ %indvars.iv195.unr, %.lr.ph137.split.us.new.preheader ]
  %40 = phi double [ %52, %.lr.ph137.split.us.new ], [ %.unr204, %.lr.ph137.split.us.new.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv195, i64 %indvars.iv205
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  store double %43, double* %35, align 8
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next196, i64 %indvars.iv205
  %45 = load double, double* %44, align 8
  %46 = fadd double %43, %45
  store double %46, double* %35, align 8
  %indvars.iv.next196.1 = add nsw i64 %indvars.iv195, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next196.1, i64 %indvars.iv205
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  store double %49, double* %35, align 8
  %indvars.iv.next196.2 = add nsw i64 %indvars.iv195, 3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next196.2, i64 %indvars.iv205
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  store double %52, double* %35, align 8
  %indvars.iv.next196.3 = add nsw i64 %indvars.iv195, 4
  %exitcond198.3 = icmp eq i64 %indvars.iv.next196.3, %wide.trip.count197.3
  br i1 %exitcond198.3, label %._crit_edge133.us.loopexit, label %.lr.ph137.split.us.new

._crit_edge133.us.loopexit:                       ; preds = %.lr.ph137.split.us.new
  br label %._crit_edge133.us

._crit_edge133.us:                                ; preds = %._crit_edge133.us.loopexit, %.prol.loopexit200
  %.lcssa143 = phi double [ %.lcssa143.unr, %.prol.loopexit200 ], [ %52, %._crit_edge133.us.loopexit ]
  %53 = fdiv double %.lcssa143, %2
  store double %53, double* %35, align 8
  %indvars.iv.next206 = add nuw nsw i64 %indvars.iv205, 1
  %exitcond208 = icmp eq i64 %indvars.iv.next206, %wide.trip.count207
  br i1 %exitcond208, label %.lr.ph129.loopexit, label %.lr.ph137.split.us

.lr.ph129.loopexit:                               ; preds = %._crit_edge133.us
  br label %.lr.ph129

.lr.ph129.loopexit248:                            ; preds = %.lr.ph137.split
  br label %.lr.ph129

.lr.ph129:                                        ; preds = %.lr.ph129.loopexit248, %.lr.ph129.loopexit, %middle.block, %.lr.ph137.split.prol.loopexit
  br i1 %9, label %.lr.ph129.split.us.preheader, label %.lr.ph129.split.preheader

.lr.ph129.split.us.preheader:                     ; preds = %.lr.ph129
  %xtraiter182 = and i32 %1, 1
  %lcmp.mod183 = icmp eq i32 %xtraiter182, 0
  %54 = icmp eq i32 %1, 1
  %wide.trip.count187 = zext i32 %0 to i64
  %wide.trip.count178.1 = zext i32 %1 to i64
  br label %.lr.ph129.split.us

.lr.ph129.split.preheader:                        ; preds = %.lr.ph129
  %xtraiter193 = and i32 %0, 1
  %lcmp.mod194 = icmp eq i32 %xtraiter193, 0
  br i1 %lcmp.mod194, label %.lr.ph129.split.prol.loopexit, label %.lr.ph129.split.prol

.lr.ph129.split.prol:                             ; preds = %.lr.ph129.split.preheader
  %55 = fdiv double 0.000000e+00, %2
  store double %55, double* %6, align 8
  %56 = tail call double @sqrt(double %55) #4
  %57 = fcmp ugt double %56, 1.000000e-01
  %58 = select i1 %57, double %56, double 1.000000e+00
  store double %58, double* %6, align 8
  br label %.lr.ph129.split.prol.loopexit

.lr.ph129.split.prol.loopexit:                    ; preds = %.lr.ph129.split.preheader, %.lr.ph129.split.prol
  %indvars.iv189.unr = phi i64 [ 1, %.lr.ph129.split.prol ], [ 0, %.lr.ph129.split.preheader ]
  %59 = icmp eq i32 %0, 1
  br i1 %59, label %._crit_edge89, label %.lr.ph129.split.preheader219

.lr.ph129.split.preheader219:                     ; preds = %.lr.ph129.split.prol.loopexit
  %60 = fdiv double 0.000000e+00, %2
  %wide.trip.count191.1 = zext i32 %0 to i64
  br label %.lr.ph129.split

.lr.ph129.split.us:                               ; preds = %._crit_edge126.us, %.lr.ph129.split.us.preheader
  %indvars.iv185 = phi i64 [ %indvars.iv.next186, %._crit_edge126.us ], [ 0, %.lr.ph129.split.us.preheader ]
  %61 = getelementptr inbounds double, double* %6, i64 %indvars.iv185
  store double 0.000000e+00, double* %61, align 8
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv185
  br i1 %lcmp.mod183, label %.prol.loopexit181, label %.prol.preheader180

.prol.preheader180:                               ; preds = %.lr.ph129.split.us
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv185
  %64 = load double, double* %63, align 8
  %65 = load double, double* %62, align 8
  %66 = fsub double %64, %65
  %67 = fmul double %66, %66
  %68 = fadd double %67, 0.000000e+00
  store double %68, double* %61, align 8
  br label %.prol.loopexit181

.prol.loopexit181:                                ; preds = %.lr.ph129.split.us, %.prol.preheader180
  %indvars.iv176.unr.ph = phi i64 [ 1, %.prol.preheader180 ], [ 0, %.lr.ph129.split.us ]
  %.unr184.ph = phi double [ %68, %.prol.preheader180 ], [ 0.000000e+00, %.lr.ph129.split.us ]
  %.lcssa142.unr.ph = phi double [ %68, %.prol.preheader180 ], [ undef, %.lr.ph129.split.us ]
  br i1 %54, label %._crit_edge126.us, label %.lr.ph129.split.us.new.preheader

.lr.ph129.split.us.new.preheader:                 ; preds = %.prol.loopexit181
  br label %.lr.ph129.split.us.new

.lr.ph129.split.us.new:                           ; preds = %.lr.ph129.split.us.new.preheader, %.lr.ph129.split.us.new
  %indvars.iv176 = phi i64 [ %indvars.iv.next177.1, %.lr.ph129.split.us.new ], [ %indvars.iv176.unr.ph, %.lr.ph129.split.us.new.preheader ]
  %69 = phi double [ %81, %.lr.ph129.split.us.new ], [ %.unr184.ph, %.lr.ph129.split.us.new.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv176, i64 %indvars.iv185
  %71 = load double, double* %70, align 8
  %72 = load double, double* %62, align 8
  %73 = fsub double %71, %72
  %74 = fmul double %73, %73
  %75 = fadd double %69, %74
  store double %75, double* %61, align 8
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next177, i64 %indvars.iv185
  %77 = load double, double* %76, align 8
  %78 = load double, double* %62, align 8
  %79 = fsub double %77, %78
  %80 = fmul double %79, %79
  %81 = fadd double %75, %80
  store double %81, double* %61, align 8
  %indvars.iv.next177.1 = add nsw i64 %indvars.iv176, 2
  %exitcond179.1 = icmp eq i64 %indvars.iv.next177.1, %wide.trip.count178.1
  br i1 %exitcond179.1, label %._crit_edge126.us.loopexit, label %.lr.ph129.split.us.new

._crit_edge126.us.loopexit:                       ; preds = %.lr.ph129.split.us.new
  br label %._crit_edge126.us

._crit_edge126.us:                                ; preds = %._crit_edge126.us.loopexit, %.prol.loopexit181
  %.lcssa142 = phi double [ %.lcssa142.unr.ph, %.prol.loopexit181 ], [ %81, %._crit_edge126.us.loopexit ]
  %82 = fdiv double %.lcssa142, %2
  store double %82, double* %61, align 8
  %83 = tail call double @sqrt(double %82) #4
  %84 = fcmp ugt double %83, 1.000000e-01
  %85 = select i1 %84, double %83, double 1.000000e+00
  store double %85, double* %61, align 8
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond188 = icmp eq i64 %indvars.iv.next186, %wide.trip.count187
  br i1 %exitcond188, label %._crit_edge89.loopexit, label %.lr.ph129.split.us

.lr.ph137.split:                                  ; preds = %.lr.ph137.split.preheader247, %.lr.ph137.split
  %indvars.iv209 = phi i64 [ %indvars.iv.next210.3, %.lr.ph137.split ], [ %indvars.iv209.ph, %.lr.ph137.split.preheader247 ]
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv209
  store double %14, double* %86, align 8
  %indvars.iv.next210 = add nuw nsw i64 %indvars.iv209, 1
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next210
  store double %14, double* %87, align 8
  %indvars.iv.next210.1 = add nsw i64 %indvars.iv209, 2
  %88 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next210.1
  store double %14, double* %88, align 8
  %indvars.iv.next210.2 = add nsw i64 %indvars.iv209, 3
  %89 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next210.2
  store double %14, double* %89, align 8
  %indvars.iv.next210.3 = add nsw i64 %indvars.iv209, 4
  %exitcond212.3 = icmp eq i64 %indvars.iv.next210.3, %wide.trip.count211.3
  br i1 %exitcond212.3, label %.lr.ph129.loopexit248, label %.lr.ph137.split, !llvm.loop !7

._crit_edge89.loopexit:                           ; preds = %._crit_edge126.us
  br label %._crit_edge89

._crit_edge89.loopexit246:                        ; preds = %.lr.ph129.split
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit246, %._crit_edge89.loopexit, %.lr.ph129.split.prol.loopexit, %7
  %90 = icmp sgt i32 %1, 0
  br i1 %90, label %._crit_edge90.lr.ph, label %._crit_edge91

._crit_edge90.lr.ph:                              ; preds = %._crit_edge89
  br i1 %8, label %._crit_edge90.us.preheader, label %._crit_edge91.thread

._crit_edge90.us.preheader:                       ; preds = %._crit_edge90.lr.ph
  %wide.trip.count169 = zext i32 %0 to i64
  %wide.trip.count173 = zext i32 %1 to i64
  br label %._crit_edge90.us

._crit_edge91.thread:                             ; preds = %._crit_edge90.lr.ph
  %91 = add nsw i32 %0, -1
  br label %._crit_edge109

._crit_edge90.us:                                 ; preds = %._crit_edge121.us, %._crit_edge90.us.preheader
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %._crit_edge121.us ], [ 0, %._crit_edge90.us.preheader ]
  br label %92

; <label>:92:                                     ; preds = %92, %._crit_edge90.us
  %indvars.iv167 = phi i64 [ 0, %._crit_edge90.us ], [ %indvars.iv.next168, %92 ]
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv167
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv171, i64 %indvars.iv167
  %96 = load double, double* %95, align 8
  %97 = fsub double %96, %94
  store double %97, double* %95, align 8
  %98 = tail call double @sqrt(double %2) #4
  %99 = getelementptr inbounds double, double* %6, i64 %indvars.iv167
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = load double, double* %95, align 8
  %103 = fdiv double %102, %101
  store double %103, double* %95, align 8
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond170 = icmp eq i64 %indvars.iv.next168, %wide.trip.count169
  br i1 %exitcond170, label %._crit_edge121.us, label %92

._crit_edge121.us:                                ; preds = %92
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, %wide.trip.count173
  br i1 %exitcond174, label %._crit_edge91.loopexit, label %._crit_edge90.us

.lr.ph129.split:                                  ; preds = %.lr.ph129.split, %.lr.ph129.split.preheader219
  %indvars.iv189 = phi i64 [ %indvars.iv.next190.1, %.lr.ph129.split ], [ %indvars.iv189.unr, %.lr.ph129.split.preheader219 ]
  %104 = getelementptr inbounds double, double* %6, i64 %indvars.iv189
  store double %60, double* %104, align 8
  %105 = tail call double @sqrt(double %60) #4
  %106 = fcmp ugt double %105, 1.000000e-01
  %107 = select i1 %106, double %105, double 1.000000e+00
  store double %107, double* %104, align 8
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %108 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next190
  store double %60, double* %108, align 8
  %109 = tail call double @sqrt(double %60) #4
  %110 = fcmp ugt double %109, 1.000000e-01
  %111 = select i1 %110, double %109, double 1.000000e+00
  store double %111, double* %108, align 8
  %indvars.iv.next190.1 = add nsw i64 %indvars.iv189, 2
  %exitcond192.1 = icmp eq i64 %indvars.iv.next190.1, %wide.trip.count191.1
  br i1 %exitcond192.1, label %._crit_edge89.loopexit246, label %.lr.ph129.split

._crit_edge91.loopexit:                           ; preds = %._crit_edge121.us
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91.loopexit, %._crit_edge89
  %112 = add nsw i32 %0, -1
  %113 = icmp sgt i32 %0, 1
  br i1 %113, label %.lr.ph108, label %._crit_edge109

.lr.ph108:                                        ; preds = %._crit_edge91
  br i1 %90, label %.lr.ph108.split.us.preheader, label %.lr.ph108.split.preheader

.lr.ph108.split.preheader:                        ; preds = %.lr.ph108
  %114 = zext i32 %112 to i64
  %115 = add i32 %0, -2
  %116 = zext i32 %115 to i64
  %117 = sext i32 %0 to i64
  %wide.trip.count158.3 = zext i32 %0 to i64
  br label %.lr.ph108.split

.lr.ph108.split.us.preheader:                     ; preds = %.lr.ph108
  %118 = sext i32 %0 to i64
  %wide.trip.count152 = zext i32 %112 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %119 = icmp eq i32 %1, 1
  %wide.trip.count148 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph108.split.us

.lr.ph108.split.us:                               ; preds = %._crit_edge106.us-lcssa.us.us, %.lr.ph108.split.us.preheader
  %indvars.iv150 = phi i64 [ 0, %.lr.ph108.split.us.preheader ], [ %indvars.iv.next151, %._crit_edge106.us-lcssa.us.us ]
  %indvars.iv144 = phi i64 [ 1, %.lr.ph108.split.us.preheader ], [ %indvars.iv.next145, %._crit_edge106.us-lcssa.us.us ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv150
  store double 1.000000e+00, double* %120, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %121 = icmp slt i64 %indvars.iv.next151, %118
  br i1 %121, label %.lr.ph.us.us.preheader, label %._crit_edge106.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph108.split.us
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv150
  br label %.lr.ph.us.us

._crit_edge106.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge100.us.us
  br label %._crit_edge106.us-lcssa.us.us

._crit_edge106.us-lcssa.us.us:                    ; preds = %._crit_edge106.us-lcssa.us.us.loopexit, %.lr.ph108.split.us
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next151, %wide.trip.count152
  br i1 %exitcond153, label %._crit_edge109.loopexit, label %.lr.ph108.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge100.us.us, %.lr.ph.us.us.preheader
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %._crit_edge100.us.us ], [ %indvars.iv144, %.lr.ph.us.us.preheader ]
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv146
  store double 0.000000e+00, double* %123, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %124 = load double, double* %122, align 8
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv146
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = fadd double %127, 0.000000e+00
  store double %128, double* %123, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %128, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %128, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %119, label %._crit_edge100.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge100.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge100.us.us

._crit_edge100.us.us:                             ; preds = %._crit_edge100.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %142, %._crit_edge100.us.us.loopexit ]
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146, i64 %indvars.iv150
  store double %.lcssa, double* %129, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond = icmp eq i64 %indvars.iv.next147, %wide.trip.count148
  br i1 %exitcond, label %._crit_edge106.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %130 = phi double [ %142, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv150
  %132 = load double, double* %131, align 8
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv146
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = fadd double %130, %135
  store double %136, double* %123, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv150
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv146
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fadd double %136, %141
  store double %142, double* %123, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge100.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph108.split:                                  ; preds = %._crit_edge106, %.lr.ph108.split.preheader
  %indvars.iv163 = phi i64 [ 0, %.lr.ph108.split.preheader ], [ %indvars.iv.next164, %._crit_edge106 ]
  %indvars.iv154 = phi i64 [ 1, %.lr.ph108.split.preheader ], [ %indvars.iv.next155, %._crit_edge106 ]
  %143 = sub i64 %116, %indvars.iv163
  %144 = trunc i64 %143 to i32
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv163
  store double 1.000000e+00, double* %145, align 8
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %146 = icmp slt i64 %indvars.iv.next164, %117
  br i1 %146, label %.lr.ph105.split.preheader, label %._crit_edge106

.lr.ph105.split.preheader:                        ; preds = %.lr.ph108.split
  %147 = sub i64 %114, %indvars.iv163
  %148 = trunc i64 %147 to i32
  %xtraiter161 = and i32 %148, 3
  %lcmp.mod162 = icmp eq i32 %xtraiter161, 0
  br i1 %lcmp.mod162, label %.lr.ph105.split.prol.loopexit, label %.lr.ph105.split.prol.preheader

.lr.ph105.split.prol.preheader:                   ; preds = %.lr.ph105.split.preheader
  br label %.lr.ph105.split.prol

.lr.ph105.split.prol:                             ; preds = %.lr.ph105.split.prol.preheader, %.lr.ph105.split.prol
  %indvars.iv156.prol = phi i64 [ %indvars.iv.next157.prol, %.lr.ph105.split.prol ], [ %indvars.iv154, %.lr.ph105.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph105.split.prol ], [ %xtraiter161, %.lr.ph105.split.prol.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv156.prol
  store double 0.000000e+00, double* %149, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156.prol, i64 %indvars.iv163
  %151 = bitcast double* %150 to i64*
  store i64 0, i64* %151, align 8
  %indvars.iv.next157.prol = add nuw nsw i64 %indvars.iv156.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph105.split.prol.loopexit.loopexit, label %.lr.ph105.split.prol, !llvm.loop !9

.lr.ph105.split.prol.loopexit.loopexit:           ; preds = %.lr.ph105.split.prol
  br label %.lr.ph105.split.prol.loopexit

.lr.ph105.split.prol.loopexit:                    ; preds = %.lr.ph105.split.prol.loopexit.loopexit, %.lr.ph105.split.preheader
  %indvars.iv156.unr = phi i64 [ %indvars.iv154, %.lr.ph105.split.preheader ], [ %indvars.iv.next157.prol, %.lr.ph105.split.prol.loopexit.loopexit ]
  %152 = icmp ult i32 %144, 3
  br i1 %152, label %._crit_edge106, label %.lr.ph105.split.preheader244

.lr.ph105.split.preheader244:                     ; preds = %.lr.ph105.split.prol.loopexit
  br label %.lr.ph105.split

.lr.ph105.split:                                  ; preds = %.lr.ph105.split.preheader244, %.lr.ph105.split
  %indvars.iv156 = phi i64 [ %indvars.iv.next157.3, %.lr.ph105.split ], [ %indvars.iv156.unr, %.lr.ph105.split.preheader244 ]
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv156
  store double 0.000000e+00, double* %153, align 8
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156, i64 %indvars.iv163
  %155 = bitcast double* %154 to i64*
  store i64 0, i64* %155, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv.next157
  store double 0.000000e+00, double* %156, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next157, i64 %indvars.iv163
  %158 = bitcast double* %157 to i64*
  store i64 0, i64* %158, align 8
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv.next157.1
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next157.1, i64 %indvars.iv163
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next157.2 = add nsw i64 %indvars.iv156, 3
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv.next157.2
  store double 0.000000e+00, double* %162, align 8
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next157.2, i64 %indvars.iv163
  %164 = bitcast double* %163 to i64*
  store i64 0, i64* %164, align 8
  %indvars.iv.next157.3 = add nsw i64 %indvars.iv156, 4
  %exitcond159.3 = icmp eq i64 %indvars.iv.next157.3, %wide.trip.count158.3
  br i1 %exitcond159.3, label %._crit_edge106.loopexit, label %.lr.ph105.split

._crit_edge106.loopexit:                          ; preds = %.lr.ph105.split
  br label %._crit_edge106

._crit_edge106:                                   ; preds = %._crit_edge106.loopexit, %.lr.ph105.split.prol.loopexit, %.lr.ph108.split
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next164, %114
  br i1 %exitcond166, label %._crit_edge109.loopexit245, label %.lr.ph108.split

._crit_edge109.loopexit:                          ; preds = %._crit_edge106.us-lcssa.us.us
  br label %._crit_edge109

._crit_edge109.loopexit245:                       ; preds = %._crit_edge106
  br label %._crit_edge109

._crit_edge109:                                   ; preds = %._crit_edge109.loopexit245, %._crit_edge109.loopexit, %._crit_edge91, %._crit_edge91.thread
  %165 = phi i32 [ %91, %._crit_edge91.thread ], [ %112, %._crit_edge91 ], [ %112, %._crit_edge109.loopexit ], [ %112, %._crit_edge109.loopexit245 ]
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %166
  store double 1.000000e+00, double* %167, align 8
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
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge13

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge11.us, %._crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge11.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge9.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge11.us, label %10

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %._crit_edge.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
