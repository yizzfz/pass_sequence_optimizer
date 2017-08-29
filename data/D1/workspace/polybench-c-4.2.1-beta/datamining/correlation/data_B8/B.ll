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
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
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
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %4
  %indvars.iv9 = phi i64 [ 0, %4 ], [ %indvars.iv.next10, %20 ]
  %5 = trunc i64 %indvars.iv9 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph127, label %._crit_edge90

.lr.ph127:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph127.split.us.preheader, label %.lr.ph127.split.preheader

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127
  %10 = add i32 %0, -1
  %xtraiter199 = and i32 %0, 3
  %lcmp.mod200 = icmp eq i32 %xtraiter199, 0
  br i1 %lcmp.mod200, label %.lr.ph127.split.prol.loopexit, label %.lr.ph127.split.prol.preheader

.lr.ph127.split.prol.preheader:                   ; preds = %.lr.ph127.split.preheader
  %11 = add nsw i32 %xtraiter199, -1
  %12 = zext i32 %11 to i64
  %13 = fdiv double 0.000000e+00, %2
  br label %.lr.ph127.split.prol

.lr.ph127.split.prol:                             ; preds = %.lr.ph127.split.prol.preheader, %.lr.ph127.split.prol
  %indvars.iv195.prol = phi i64 [ %indvars.iv.next196.prol, %.lr.ph127.split.prol ], [ 0, %.lr.ph127.split.prol.preheader ]
  %prol.iter201 = phi i32 [ %prol.iter201.sub, %.lr.ph127.split.prol ], [ %xtraiter199, %.lr.ph127.split.prol.preheader ]
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv195.prol
  store double %13, double* %14, align 8
  %indvars.iv.next196.prol = add nuw nsw i64 %indvars.iv195.prol, 1
  %prol.iter201.sub = add nsw i32 %prol.iter201, -1
  %prol.iter201.cmp = icmp eq i32 %prol.iter201.sub, 0
  br i1 %prol.iter201.cmp, label %.lr.ph127.split.prol.loopexit.loopexit, label %.lr.ph127.split.prol, !llvm.loop !1

.lr.ph127.split.prol.loopexit.loopexit:           ; preds = %.lr.ph127.split.prol
  %15 = add nuw nsw i64 %12, 1
  br label %.lr.ph127.split.prol.loopexit

.lr.ph127.split.prol.loopexit:                    ; preds = %.lr.ph127.split.prol.loopexit.loopexit, %.lr.ph127.split.preheader
  %indvars.iv195.unr = phi i64 [ 0, %.lr.ph127.split.preheader ], [ %15, %.lr.ph127.split.prol.loopexit.loopexit ]
  %16 = icmp ult i32 %10, 3
  br i1 %16, label %.lr.ph120, label %.lr.ph127.split.preheader238

.lr.ph127.split.preheader238:                     ; preds = %.lr.ph127.split.prol.loopexit
  %17 = fdiv double 0.000000e+00, %2
  %wide.trip.count197.3 = zext i32 %0 to i64
  %18 = add nsw i64 %wide.trip.count197.3, -4
  %19 = sub nsw i64 %18, %indvars.iv195.unr
  %20 = lshr i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %min.iters.check = icmp ult i64 %21, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader296, label %min.iters.checked

.lr.ph127.split.preheader296:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader238
  %indvars.iv195.ph = phi i64 [ %indvars.iv195.unr, %min.iters.checked ], [ %indvars.iv195.unr, %.lr.ph127.split.preheader238 ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader238
  %n.mod.vf = and i64 %21, 3
  %n.vec = sub nsw i64 %21, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %22 = shl nuw i64 %20, 2
  %23 = add i64 %indvars.iv195.unr, %22
  %24 = add i64 %23, 4
  %25 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %24, %25
  br i1 %cmp.zero, label %.lr.ph127.split.preheader296, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert279 = insertelement <2 x double> undef, double %17, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert279, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %26 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv195.unr, %26
  %27 = add nsw i64 %offset.idx, 3
  %28 = add i64 %offset.idx, 11
  %29 = getelementptr inbounds double, double* %5, i64 %27
  %30 = getelementptr inbounds double, double* %5, i64 %28
  %31 = getelementptr double, double* %29, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  %33 = getelementptr double, double* %30, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %32, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  %index.next = add i64 %index, 4
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.lr.ph120, label %.lr.ph127.split.preheader296

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %36 = add i32 %1, -1
  %37 = and i32 %1, 3
  %38 = add nsw i32 %37, -1
  %39 = zext i32 %38 to i64
  %40 = add nuw nsw i64 %39, 1
  %41 = zext i32 %0 to i64
  %wide.trip.count184.3 = zext i32 %1 to i64
  %42 = icmp eq i32 %37, 0
  %.pre284 = ptrtoint double* %5 to i64
  %43 = icmp ult i32 %36, 3
  %44 = ptrtoint double* %5 to i64
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %._crit_edge124.us, %.lr.ph127.split.us.preheader
  %indvars.iv191 = phi i64 [ 0, %.lr.ph127.split.us.preheader ], [ %indvars.iv.next192, %._crit_edge124.us ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv191
  store double 0.000000e+00, double* %45, align 8
  br i1 %42, label %.lr.ph127.split.us..prol.loopexit187_crit_edge, label %.prol.preheader186.preheader

.lr.ph127.split.us..prol.loopexit187_crit_edge:   ; preds = %.lr.ph127.split.us
  %.pre285 = shl nuw nsw i64 %indvars.iv191, 3
  %.pre286 = add i64 %.pre284, %.pre285
  %.pre287 = inttoptr i64 %.pre286 to double*
  br label %.prol.loopexit187

.prol.preheader186.preheader:                     ; preds = %.lr.ph127.split.us
  %sunkaddr203 = shl i64 %indvars.iv191, 3
  %sunkaddr204 = add i64 %44, %sunkaddr203
  %sunkaddr205 = inttoptr i64 %sunkaddr204 to double*
  %.pre = load double, double* %sunkaddr205, align 8
  br label %.prol.preheader186

.prol.preheader186:                               ; preds = %.prol.preheader186.preheader, %.prol.preheader186
  %46 = phi double [ %49, %.prol.preheader186 ], [ %.pre, %.prol.preheader186.preheader ]
  %indvars.iv182.prol = phi i64 [ %indvars.iv.next183.prol, %.prol.preheader186 ], [ 0, %.prol.preheader186.preheader ]
  %prol.iter190 = phi i32 [ %prol.iter190.sub, %.prol.preheader186 ], [ %37, %.prol.preheader186.preheader ]
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182.prol, i64 %indvars.iv191
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %sunkaddr205, align 8
  %indvars.iv.next183.prol = add nuw nsw i64 %indvars.iv182.prol, 1
  %prol.iter190.sub = add nsw i32 %prol.iter190, -1
  %prol.iter190.cmp = icmp eq i32 %prol.iter190.sub, 0
  br i1 %prol.iter190.cmp, label %.prol.loopexit187.loopexit, label %.prol.preheader186, !llvm.loop !6

.prol.loopexit187.loopexit:                       ; preds = %.prol.preheader186
  br label %.prol.loopexit187

.prol.loopexit187:                                ; preds = %.prol.loopexit187.loopexit, %.lr.ph127.split.us..prol.loopexit187_crit_edge
  %.pre254.pre-phi = phi double* [ %.pre287, %.lr.ph127.split.us..prol.loopexit187_crit_edge ], [ %sunkaddr205, %.prol.loopexit187.loopexit ]
  %indvars.iv182.unr = phi i64 [ 0, %.lr.ph127.split.us..prol.loopexit187_crit_edge ], [ %40, %.prol.loopexit187.loopexit ]
  %.pre282 = load double, double* %.pre254.pre-phi, align 8
  br i1 %43, label %._crit_edge124.us, label %.lr.ph127.split.us.new.preheader

.lr.ph127.split.us.new.preheader:                 ; preds = %.prol.loopexit187
  br label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.lr.ph127.split.us.new.preheader, %.lr.ph127.split.us.new
  %50 = phi double [ %62, %.lr.ph127.split.us.new ], [ %.pre282, %.lr.ph127.split.us.new.preheader ]
  %indvars.iv182 = phi i64 [ %indvars.iv.next183.3, %.lr.ph127.split.us.new ], [ %indvars.iv182.unr, %.lr.ph127.split.us.new.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182, i64 %indvars.iv191
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %.pre254.pre-phi, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183, i64 %indvars.iv191
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %.pre254.pre-phi, align 8
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, 2
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183.1, i64 %indvars.iv191
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %.pre254.pre-phi, align 8
  %indvars.iv.next183.2 = add nsw i64 %indvars.iv182, 3
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183.2, i64 %indvars.iv191
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %.pre254.pre-phi, align 8
  %indvars.iv.next183.3 = add nsw i64 %indvars.iv182, 4
  %exitcond185.3 = icmp eq i64 %indvars.iv.next183.3, %wide.trip.count184.3
  br i1 %exitcond185.3, label %._crit_edge124.us.loopexit, label %.lr.ph127.split.us.new

._crit_edge124.us.loopexit:                       ; preds = %.lr.ph127.split.us.new
  br label %._crit_edge124.us

._crit_edge124.us:                                ; preds = %._crit_edge124.us.loopexit, %.prol.loopexit187
  %63 = phi double [ %.pre282, %.prol.loopexit187 ], [ %62, %._crit_edge124.us.loopexit ]
  %64 = fdiv double %63, %2
  store double %64, double* %.pre254.pre-phi, align 8
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %exitcond249 = icmp eq i64 %indvars.iv.next192, %41
  br i1 %exitcond249, label %.lr.ph120.loopexit, label %.lr.ph127.split.us

.lr.ph120.loopexit:                               ; preds = %._crit_edge124.us
  br label %.lr.ph120

.lr.ph120.loopexit297:                            ; preds = %.lr.ph127.split
  br label %.lr.ph120

.lr.ph120:                                        ; preds = %.lr.ph120.loopexit297, %.lr.ph120.loopexit, %middle.block, %.lr.ph127.split.prol.loopexit
  br i1 %9, label %.lr.ph120.split.us.preheader, label %.lr.ph120.split.preheader

.lr.ph120.split.us.preheader:                     ; preds = %.lr.ph120
  %65 = zext i32 %0 to i64
  %xtraiter170 = and i32 %1, 1
  %wide.trip.count166.1 = zext i32 %1 to i64
  %66 = icmp eq i32 %xtraiter170, 0
  %.pre288 = ptrtoint double* %6 to i64
  %67 = icmp eq i32 %1, 1
  %sunkaddr265 = ptrtoint double* %5 to i64
  %68 = ptrtoint double* %5 to i64
  %69 = ptrtoint double* %6 to i64
  br label %.lr.ph120.split.us

.lr.ph120.split.preheader:                        ; preds = %.lr.ph120
  %xtraiter180 = and i32 %0, 1
  %lcmp.mod181 = icmp eq i32 %xtraiter180, 0
  br i1 %lcmp.mod181, label %.lr.ph120.split.prol.loopexit, label %.lr.ph120.split.prol

.lr.ph120.split.prol:                             ; preds = %.lr.ph120.split.preheader
  %70 = fdiv double 0.000000e+00, %2
  store double %70, double* %6, align 8
  %71 = tail call double @sqrt(double %70) #4
  %72 = fcmp ugt double %71, 1.000000e-01
  %73 = select i1 %72, double %71, double 1.000000e+00
  store double %73, double* %6, align 8
  br label %.lr.ph120.split.prol.loopexit

.lr.ph120.split.prol.loopexit:                    ; preds = %.lr.ph120.split.preheader, %.lr.ph120.split.prol
  %indvars.iv176.unr = phi i64 [ 0, %.lr.ph120.split.preheader ], [ 1, %.lr.ph120.split.prol ]
  %74 = icmp eq i32 %0, 1
  br i1 %74, label %._crit_edge90, label %.lr.ph120.split.preheader236

.lr.ph120.split.preheader236:                     ; preds = %.lr.ph120.split.prol.loopexit
  %75 = fdiv double 0.000000e+00, %2
  %wide.trip.count178.1 = zext i32 %0 to i64
  br label %.lr.ph120.split

.lr.ph120.split.us:                               ; preds = %.lr.ph120.split.us.preheader, %._crit_edge118.us
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge118.us ], [ 0, %.lr.ph120.split.us.preheader ]
  %76 = getelementptr inbounds double, double* %6, i64 %indvars.iv172
  store double 0.000000e+00, double* %76, align 8
  br i1 %66, label %.lr.ph120.split.us..prol.loopexit169_crit_edge, label %.prol.preheader168

.lr.ph120.split.us..prol.loopexit169_crit_edge:   ; preds = %.lr.ph120.split.us
  %.pre290 = shl i64 %indvars.iv172, 3
  %.pre291 = add i64 %.pre288, %.pre290
  %.pre292 = inttoptr i64 %.pre291 to double*
  br label %.prol.loopexit169

.prol.preheader168:                               ; preds = %.lr.ph120.split.us
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv172
  %78 = load double, double* %77, align 8
  %sunkaddr215 = shl nuw nsw i64 %indvars.iv172, 3
  %sunkaddr216 = add i64 %68, %sunkaddr215
  %sunkaddr217 = inttoptr i64 %sunkaddr216 to double*
  %79 = load double, double* %sunkaddr217, align 8
  %80 = fsub double %78, %79
  %81 = fmul double %80, %80
  %sunkaddr220 = add i64 %69, %sunkaddr215
  %sunkaddr221 = inttoptr i64 %sunkaddr220 to double*
  %82 = load double, double* %sunkaddr221, align 8
  %83 = fadd double %82, %81
  store double %83, double* %sunkaddr221, align 8
  br label %.prol.loopexit169

.prol.loopexit169:                                ; preds = %.lr.ph120.split.us..prol.loopexit169_crit_edge, %.prol.preheader168
  %.pre257.pre-phi = phi double* [ %.pre292, %.lr.ph120.split.us..prol.loopexit169_crit_edge ], [ %sunkaddr221, %.prol.preheader168 ]
  %.pre255.pre-phi = phi i64 [ %.pre290, %.lr.ph120.split.us..prol.loopexit169_crit_edge ], [ %sunkaddr215, %.prol.preheader168 ]
  %indvars.iv164.unr.ph = phi i64 [ 0, %.lr.ph120.split.us..prol.loopexit169_crit_edge ], [ 1, %.prol.preheader168 ]
  %.pre283 = load double, double* %.pre257.pre-phi, align 8
  br i1 %67, label %._crit_edge118.us, label %.lr.ph120.split.us.new.preheader

.lr.ph120.split.us.new.preheader:                 ; preds = %.prol.loopexit169
  %sunkaddr267 = add i64 %sunkaddr265, %.pre255.pre-phi
  %sunkaddr268 = inttoptr i64 %sunkaddr267 to double*
  br label %.lr.ph120.split.us.new

.lr.ph120.split.us.new:                           ; preds = %.lr.ph120.split.us.new.preheader, %.lr.ph120.split.us.new
  %84 = phi double [ %96, %.lr.ph120.split.us.new ], [ %.pre283, %.lr.ph120.split.us.new.preheader ]
  %indvars.iv164 = phi i64 [ %indvars.iv.next165.1, %.lr.ph120.split.us.new ], [ %indvars.iv164.unr.ph, %.lr.ph120.split.us.new.preheader ]
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv164, i64 %indvars.iv172
  %86 = load double, double* %85, align 8
  %87 = load double, double* %sunkaddr268, align 8
  %88 = fsub double %86, %87
  %89 = fmul double %88, %88
  %90 = fadd double %84, %89
  store double %90, double* %.pre257.pre-phi, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next165, i64 %indvars.iv172
  %92 = load double, double* %91, align 8
  %93 = load double, double* %sunkaddr268, align 8
  %94 = fsub double %92, %93
  %95 = fmul double %94, %94
  %96 = fadd double %90, %95
  store double %96, double* %.pre257.pre-phi, align 8
  %indvars.iv.next165.1 = add nuw nsw i64 %indvars.iv164, 2
  %exitcond167.1 = icmp eq i64 %indvars.iv.next165.1, %wide.trip.count166.1
  br i1 %exitcond167.1, label %._crit_edge118.us.loopexit, label %.lr.ph120.split.us.new

._crit_edge118.us.loopexit:                       ; preds = %.lr.ph120.split.us.new
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %._crit_edge118.us.loopexit, %.prol.loopexit169
  %97 = phi double [ %.pre283, %.prol.loopexit169 ], [ %96, %._crit_edge118.us.loopexit ]
  %98 = fdiv double %97, %2
  store double %98, double* %.pre257.pre-phi, align 8
  %99 = tail call double @sqrt(double %98) #4
  %100 = fcmp ugt double %99, 1.000000e-01
  %101 = select i1 %100, double %99, double 1.000000e+00
  store double %101, double* %.pre257.pre-phi, align 8
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172, 1
  %exitcond248 = icmp eq i64 %indvars.iv.next173, %65
  br i1 %exitcond248, label %._crit_edge90.loopexit, label %.lr.ph120.split.us

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader296, %.lr.ph127.split
  %indvars.iv195 = phi i64 [ %indvars.iv.next196.3, %.lr.ph127.split ], [ %indvars.iv195.ph, %.lr.ph127.split.preheader296 ]
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv195
  store double %17, double* %102, align 8
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %103 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next196
  store double %17, double* %103, align 8
  %indvars.iv.next196.1 = add nsw i64 %indvars.iv195, 2
  %104 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next196.1
  store double %17, double* %104, align 8
  %indvars.iv.next196.2 = add nsw i64 %indvars.iv195, 3
  %105 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next196.2
  store double %17, double* %105, align 8
  %indvars.iv.next196.3 = add nsw i64 %indvars.iv195, 4
  %exitcond198.3 = icmp eq i64 %indvars.iv.next196.3, %wide.trip.count197.3
  br i1 %exitcond198.3, label %.lr.ph120.loopexit297, label %.lr.ph127.split, !llvm.loop !7

._crit_edge90.loopexit:                           ; preds = %._crit_edge118.us
  br label %._crit_edge90

._crit_edge90.loopexit295:                        ; preds = %.lr.ph120.split
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90.loopexit295, %._crit_edge90.loopexit, %7, %.lr.ph120.split.prol.loopexit
  %106 = icmp sgt i32 %1, 0
  br i1 %106, label %._crit_edge91.lr.ph, label %._crit_edge92

._crit_edge91.lr.ph:                              ; preds = %._crit_edge90
  br i1 %8, label %._crit_edge91.us.preheader, label %._crit_edge92.thread

._crit_edge91.us.preheader:                       ; preds = %._crit_edge91.lr.ph
  %107 = zext i32 %0 to i64
  %108 = zext i32 %1 to i64
  br label %._crit_edge91.us

._crit_edge92.thread:                             ; preds = %._crit_edge91.lr.ph
  %109 = add nsw i32 %0, -1
  br label %._crit_edge103

._crit_edge91.us:                                 ; preds = %._crit_edge91.us.preheader, %._crit_edge113.us
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge113.us ], [ 0, %._crit_edge91.us.preheader ]
  br label %110

; <label>:110:                                    ; preds = %110, %._crit_edge91.us
  %indvars.iv155 = phi i64 [ 0, %._crit_edge91.us ], [ %indvars.iv.next156, %110 ]
  %111 = getelementptr inbounds double, double* %5, i64 %indvars.iv155
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv159, i64 %indvars.iv155
  %114 = load double, double* %113, align 8
  %115 = fsub double %114, %112
  store double %115, double* %113, align 8
  %116 = tail call double @sqrt(double %2) #4
  %117 = getelementptr inbounds double, double* %6, i64 %indvars.iv155
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = load double, double* %113, align 8
  %121 = fdiv double %120, %119
  store double %121, double* %113, align 8
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond246 = icmp eq i64 %indvars.iv.next156, %107
  br i1 %exitcond246, label %._crit_edge113.us, label %110

._crit_edge113.us:                                ; preds = %110
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond247 = icmp eq i64 %indvars.iv.next160, %108
  br i1 %exitcond247, label %._crit_edge92.loopexit, label %._crit_edge91.us

.lr.ph120.split:                                  ; preds = %.lr.ph120.split.preheader236, %.lr.ph120.split
  %indvars.iv176 = phi i64 [ %indvars.iv.next177.1, %.lr.ph120.split ], [ %indvars.iv176.unr, %.lr.ph120.split.preheader236 ]
  %122 = getelementptr inbounds double, double* %6, i64 %indvars.iv176
  store double %75, double* %122, align 8
  %123 = tail call double @sqrt(double %75) #4
  %124 = fcmp ugt double %123, 1.000000e-01
  %125 = select i1 %124, double %123, double 1.000000e+00
  store double %125, double* %122, align 8
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %126 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next177
  store double %75, double* %126, align 8
  %127 = tail call double @sqrt(double %75) #4
  %128 = fcmp ugt double %127, 1.000000e-01
  %129 = select i1 %128, double %127, double 1.000000e+00
  store double %129, double* %126, align 8
  %indvars.iv.next177.1 = add nsw i64 %indvars.iv176, 2
  %exitcond179.1 = icmp eq i64 %indvars.iv.next177.1, %wide.trip.count178.1
  br i1 %exitcond179.1, label %._crit_edge90.loopexit295, label %.lr.ph120.split

._crit_edge92.loopexit:                           ; preds = %._crit_edge113.us
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.loopexit, %._crit_edge90
  %130 = add nsw i32 %0, -1
  %131 = icmp sgt i32 %0, 1
  br i1 %131, label %.lr.ph102, label %._crit_edge103

.lr.ph102:                                        ; preds = %._crit_edge92
  br i1 %106, label %.lr.ph102.split.us.preheader, label %.lr.ph102.split.preheader

.lr.ph102.split.preheader:                        ; preds = %.lr.ph102
  %132 = zext i32 %130 to i64
  %133 = add i32 %0, -2
  %134 = zext i32 %133 to i64
  %135 = sext i32 %0 to i64
  %136 = trunc i32 %130 to i2
  %wide.trip.count146.3 = zext i32 %0 to i64
  br label %.lr.ph102.split

.lr.ph102.split.us.preheader:                     ; preds = %.lr.ph102
  %137 = sext i32 %0 to i64
  %138 = zext i32 %0 to i64
  %139 = zext i32 %130 to i64
  %xtraiter = and i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  %140 = icmp eq i32 %xtraiter, 0
  %141 = icmp eq i32 %1, 1
  %sunkaddr269 = ptrtoint [1200 x double]* %3 to i64
  br label %.lr.ph102.split.us

.lr.ph102.split.us:                               ; preds = %._crit_edge100.us-lcssa.us.us, %.lr.ph102.split.us.preheader
  %indvars.iv138 = phi i64 [ 0, %.lr.ph102.split.us.preheader ], [ %indvars.iv.next139, %._crit_edge100.us-lcssa.us.us ]
  %indvars.iv132 = phi i64 [ 1, %.lr.ph102.split.us.preheader ], [ %indvars.iv.next133, %._crit_edge100.us-lcssa.us.us ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %142, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %143 = icmp slt i64 %indvars.iv.next139, %137
  br i1 %143, label %.lr.ph.us.us.preheader, label %._crit_edge100.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph102.split.us
  %sunkaddr270 = shl i64 %indvars.iv138, 3
  %sunkaddr271 = add i64 %sunkaddr269, %sunkaddr270
  %sunkaddr272 = inttoptr i64 %sunkaddr271 to double*
  br label %.lr.ph.us.us

._crit_edge100.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge95.us.us
  br label %._crit_edge100.us-lcssa.us.us

._crit_edge100.us-lcssa.us.us:                    ; preds = %._crit_edge100.us-lcssa.us.us.loopexit, %.lr.ph102.split.us
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond = icmp eq i64 %indvars.iv.next139, %139
  br i1 %exitcond, label %._crit_edge103.loopexit, label %.lr.ph102.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge95.us.us
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %._crit_edge95.us.us ], [ %indvars.iv132, %.lr.ph.us.us.preheader ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv134
  store double 0.000000e+00, double* %144, align 8
  br i1 %140, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %145 = load double, double* %sunkaddr272, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv134
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fadd double %148, 0.000000e+00
  store double %149, double* %144, align 8
  %150 = bitcast double %149 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %151 = phi i64 [ %150, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %152 = phi double [ %149, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %141, label %._crit_edge95.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge95.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %153 = bitcast double %169 to i64
  br label %._crit_edge95.us.us

._crit_edge95.us.us:                              ; preds = %._crit_edge95.us.us.loopexit, %.prol.loopexit
  %154 = phi i64 [ %151, %.prol.loopexit ], [ %153, %._crit_edge95.us.us.loopexit ]
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv134, i64 %indvars.iv138
  %156 = bitcast double* %155 to i64*
  store i64 %154, i64* %156, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond240 = icmp eq i64 %indvars.iv.next135, %138
  br i1 %exitcond240, label %._crit_edge100.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %157 = phi double [ %169, %.lr.ph.us.us.new ], [ %152, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv138
  %159 = load double, double* %158, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv134
  %161 = load double, double* %160, align 8
  %162 = fmul double %159, %161
  %163 = fadd double %157, %162
  store double %163, double* %144, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv138
  %165 = load double, double* %164, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv134
  %167 = load double, double* %166, align 8
  %168 = fmul double %165, %167
  %169 = fadd double %163, %168
  store double %169, double* %144, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge95.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph102.split:                                  ; preds = %._crit_edge100, %.lr.ph102.split.preheader
  %indvars.iv243 = phi i2 [ %indvars.iv.next244, %._crit_edge100 ], [ %136, %.lr.ph102.split.preheader ]
  %indvars.iv241 = phi i64 [ %indvars.iv.next242, %._crit_edge100 ], [ 2, %.lr.ph102.split.preheader ]
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %._crit_edge100 ], [ 0, %.lr.ph102.split.preheader ]
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %._crit_edge100 ], [ 1, %.lr.ph102.split.preheader ]
  %170 = zext i2 %indvars.iv243 to i64
  %171 = add nuw nsw i64 %170, 4294967295
  %172 = and i64 %171, 4294967295
  %173 = add i64 %indvars.iv241, %172
  %174 = sub i64 %134, %indvars.iv151
  %175 = trunc i64 %174 to i32
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv151
  store double 1.000000e+00, double* %176, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %177 = icmp slt i64 %indvars.iv.next152, %135
  br i1 %177, label %.lr.ph99.split.preheader, label %._crit_edge100

.lr.ph99.split.preheader:                         ; preds = %.lr.ph102.split
  %178 = sub i64 %132, %indvars.iv151
  %179 = trunc i64 %178 to i32
  %xtraiter149 = and i32 %179, 3
  %lcmp.mod150 = icmp eq i32 %xtraiter149, 0
  br i1 %lcmp.mod150, label %.lr.ph99.split.prol.loopexit, label %.lr.ph99.split.prol.preheader

.lr.ph99.split.prol.preheader:                    ; preds = %.lr.ph99.split.preheader
  br label %.lr.ph99.split.prol

.lr.ph99.split.prol:                              ; preds = %.lr.ph99.split.prol.preheader, %.lr.ph99.split.prol
  %indvars.iv144.prol = phi i64 [ %indvars.iv.next145.prol, %.lr.ph99.split.prol ], [ %indvars.iv142, %.lr.ph99.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph99.split.prol ], [ %xtraiter149, %.lr.ph99.split.prol.preheader ]
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv144.prol
  store double 0.000000e+00, double* %180, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144.prol, i64 %indvars.iv151
  %182 = bitcast double* %181 to i64*
  store i64 0, i64* %182, align 8
  %indvars.iv.next145.prol = add nuw nsw i64 %indvars.iv144.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph99.split.prol.loopexit.loopexit, label %.lr.ph99.split.prol, !llvm.loop !9

.lr.ph99.split.prol.loopexit.loopexit:            ; preds = %.lr.ph99.split.prol
  br label %.lr.ph99.split.prol.loopexit

.lr.ph99.split.prol.loopexit:                     ; preds = %.lr.ph99.split.prol.loopexit.loopexit, %.lr.ph99.split.preheader
  %indvars.iv144.unr = phi i64 [ %indvars.iv142, %.lr.ph99.split.preheader ], [ %173, %.lr.ph99.split.prol.loopexit.loopexit ]
  %183 = icmp ult i32 %175, 3
  br i1 %183, label %._crit_edge100, label %.lr.ph99.split.preheader293

.lr.ph99.split.preheader293:                      ; preds = %.lr.ph99.split.prol.loopexit
  br label %.lr.ph99.split

.lr.ph99.split:                                   ; preds = %.lr.ph99.split.preheader293, %.lr.ph99.split
  %indvars.iv144 = phi i64 [ %indvars.iv.next145.3, %.lr.ph99.split ], [ %indvars.iv144.unr, %.lr.ph99.split.preheader293 ]
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv144
  store double 0.000000e+00, double* %184, align 8
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144, i64 %indvars.iv151
  %186 = bitcast double* %185 to i64*
  store i64 0, i64* %186, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next145
  store double 0.000000e+00, double* %187, align 8
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145, i64 %indvars.iv151
  %189 = bitcast double* %188 to i64*
  store i64 0, i64* %189, align 8
  %indvars.iv.next145.1 = add nsw i64 %indvars.iv144, 2
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next145.1
  store double 0.000000e+00, double* %190, align 8
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.1, i64 %indvars.iv151
  %192 = bitcast double* %191 to i64*
  store i64 0, i64* %192, align 8
  %indvars.iv.next145.2 = add nsw i64 %indvars.iv144, 3
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next145.2
  store double 0.000000e+00, double* %193, align 8
  %194 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.2, i64 %indvars.iv151
  %195 = bitcast double* %194 to i64*
  store i64 0, i64* %195, align 8
  %indvars.iv.next145.3 = add nsw i64 %indvars.iv144, 4
  %exitcond147.3 = icmp eq i64 %indvars.iv.next145.3, %wide.trip.count146.3
  br i1 %exitcond147.3, label %._crit_edge100.loopexit, label %.lr.ph99.split

._crit_edge100.loopexit:                          ; preds = %.lr.ph99.split
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.loopexit, %.lr.ph99.split.prol.loopexit, %.lr.ph102.split
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %indvars.iv.next242 = add nuw i64 %indvars.iv241, 1
  %indvars.iv.next244 = add i2 %indvars.iv243, -1
  %exitcond245 = icmp eq i64 %indvars.iv.next152, %132
  br i1 %exitcond245, label %._crit_edge103.loopexit294, label %.lr.ph102.split

._crit_edge103.loopexit:                          ; preds = %._crit_edge100.us-lcssa.us.us
  br label %._crit_edge103

._crit_edge103.loopexit294:                       ; preds = %._crit_edge100
  br label %._crit_edge103

._crit_edge103:                                   ; preds = %._crit_edge103.loopexit294, %._crit_edge103.loopexit, %._crit_edge92.thread, %._crit_edge92
  %196 = phi i32 [ %109, %._crit_edge92.thread ], [ %130, %._crit_edge92 ], [ %130, %._crit_edge103.loopexit ], [ %130, %._crit_edge103.loopexit294 ]
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %197, i64 %197
  store double 1.000000e+00, double* %198, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge14

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge12.us, %._crit_edge.us.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us ]
  %10 = mul nsw i64 %indvars.iv15, %8
  br label %11

; <label>:11:                                     ; preds = %._crit_edge10.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %12 = add nsw i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge10.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond19, label %._crit_edge12.us, label %11

._crit_edge12.us:                                 ; preds = %._crit_edge10.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %9
  br i1 %exitcond, label %._crit_edge14.loopexit, label %._crit_edge.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
