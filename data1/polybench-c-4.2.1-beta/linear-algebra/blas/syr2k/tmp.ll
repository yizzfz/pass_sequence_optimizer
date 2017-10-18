; ModuleID = 'B.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %17, %14, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader5.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph11.us

; <label>:5:                                      ; preds = %6
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond30, label %..lr.ph.us_crit_edge, label %.lr.ph11.us

..lr.ph.us_crit_edge:                             ; preds = %5
  br label %.lr.ph.us

; <label>:6:                                      ; preds = %.lr.ph11.us, %6
  %indvars.iv23 = phi i64 [ 0, %.lr.ph11.us ], [ %indvars.iv.next24, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv23, %indvars.iv27
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv23
  store double %12, double* %13, align 8
  %14 = add nuw nsw i64 %7, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv23
  store double %18, double* %19, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1000
  br i1 %exitcond26, label %5, label %6

.lr.ph11.us:                                      ; preds = %5, %.preheader5.lr.ph
  %indvars.iv27 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next28, %5 ]
  br label %6

; <label>:20:                                     ; preds = %21
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond22, label %._crit_edge8, label %.lr.ph.us

; <label>:21:                                     ; preds = %.lr.ph.us, %21
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next, %21 ]
  %22 = mul nuw nsw i64 %indvars.iv, %indvars.iv19
  %23 = add nuw nsw i64 %22, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %20, label %21

.lr.ph.us:                                        ; preds = %20, %..lr.ph.us_crit_edge
  %indvars.iv19 = phi i64 [ 0, %..lr.ph.us_crit_edge ], [ %indvars.iv.next20, %20 ]
  br label %21

._crit_edge8:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* readonly, [1000 x double]* readonly) unnamed_addr #2 {
.preheader5.lr.ph:
  %broadcast.splatinsert28 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat29 = shufflevector <2 x double> %broadcast.splatinsert28, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert49 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat50 = shufflevector <2 x double> %broadcast.splatinsert49, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %.lr.ph.us.new.preheader ], [ %indvars.iv.next.3, %.lr.ph.us.new ]
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %indvars.iv
  %6 = load double, double* %5, align 8
  %7 = fmul double %6, %1
  store double %7, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %indvars.iv.next
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %1
  store double %10, double* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %1
  store double %13, double* %11, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %1
  store double %16, double* %14, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv48
  br i1 %exitcond.3, label %.lr.ph8.us25.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.loopexit34:                                      ; preds = %.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 1200
  %indvars.iv.next2 = add i2 %indvars.iv1, 1
  br i1 %exitcond53, label %._crit_edge17, label %.lr.ph.us

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv38 = phi i64 [ %indvars.iv38.ph, %scalar.ph.preheader ], [ %indvars.iv.next39, %scalar.ph ]
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv43
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %0
  %20 = load double, double* %67, align 8
  %21 = fmul double %19, %20
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv43
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %0
  %25 = load double, double* %68, align 8
  %26 = fmul double %24, %25
  %27 = fadd double %21, %26
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %indvars.iv38
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  store double %30, double* %28, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, %indvars.iv48
  br i1 %exitcond, label %.loopexit.loopexit, label %scalar.ph, !llvm.loop !5

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit:                                        ; preds = %middle.block, %.loopexit.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond46, label %.loopexit34, label %.lr.ph8.us25

.lr.ph.us:                                        ; preds = %.loopexit34, %.preheader5.lr.ph
  %indvars.iv1 = phi i2 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next2, %.loopexit34 ]
  %indvars.iv50 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next51, %.loopexit34 ]
  %indvars.iv48 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next49, %.loopexit34 ]
  %31 = add i64 %indvars.iv50, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 0
  %32 = mul i64 %indvars.iv50, 1201
  %33 = add i64 %32, 1
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %33
  %34 = add i64 %indvars.iv50, 1
  %35 = zext i2 %indvars.iv1 to i64
  %36 = add nuw nsw i64 %35, 4294967295
  %37 = and i64 %36, 4294967295
  %38 = add nuw nsw i64 %37, 1
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %39 = trunc i64 %indvars.iv.next51 to i32
  %xtraiter = and i32 %39, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.lr.ph.us..prol.preheader_crit_edge

.lr.ph.us..prol.preheader_crit_edge:              ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.lr.ph.us..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ 0, %.lr.ph.us..prol.preheader_crit_edge ], [ %indvars.iv.next.prol, %.prol.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %.lr.ph.us..prol.preheader_crit_edge ], [ %prol.iter.sub, %.prol.preheader ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %indvars.iv.prol
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %1
  store double %42, double* %40, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !6

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %38, %.prol.loopexit.loopexit ]
  %43 = icmp ult i64 %indvars.iv50, 3
  br i1 %43, label %.lr.ph8.us25.preheader, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  %44 = sub i64 %31, %indvars.iv.unr
  %45 = lshr i64 %44, 2
  %46 = add nuw nsw i64 %45, 1
  %min.iters.check33 = icmp ult i64 %46, 2
  br i1 %min.iters.check33, label %.lr.ph.us.new.preheader, label %min.iters.checked34

min.iters.checked34:                              ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge
  %n.mod.vf35 = and i64 %46, 1
  %n.vec36 = sub nsw i64 %46, %n.mod.vf35
  %cmp.zero37 = icmp eq i64 %n.vec36, 0
  %47 = add nsw i64 %indvars.iv.unr, 4
  %48 = shl nuw i64 %45, 2
  %49 = add i64 %47, %48
  %50 = shl nuw nsw i64 %n.mod.vf35, 2
  %ind.end = sub i64 %49, %50
  br i1 %cmp.zero37, label %.lr.ph.us.new.preheader, label %vector.ph38

vector.ph38:                                      ; preds = %min.iters.checked34
  br label %vector.body30

vector.body30:                                    ; preds = %vector.body30, %vector.ph38
  %index39 = phi i64 [ 0, %vector.ph38 ], [ %index.next40, %vector.body30 ]
  %51 = shl i64 %index39, 2
  %52 = add i64 %indvars.iv.unr, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %52
  %54 = bitcast double* %53 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %54, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec46 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec47 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec48 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %55 = fmul <2 x double> %strided.vec, %broadcast.splat50
  %56 = fmul <2 x double> %strided.vec46, %broadcast.splat50
  %57 = fmul <2 x double> %strided.vec47, %broadcast.splat50
  %58 = add nsw i64 %52, 3
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %58
  %60 = fmul <2 x double> %strided.vec48, %broadcast.splat50
  %61 = getelementptr double, double* %59, i64 -3
  %62 = bitcast double* %61 to <8 x double>*
  %63 = shufflevector <2 x double> %55, <2 x double> %56, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %64 = shufflevector <2 x double> %57, <2 x double> %60, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %63, <4 x double> %64, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %62, align 8
  %index.next40 = add i64 %index39, 2
  %65 = icmp eq i64 %index.next40, %n.vec36
  br i1 %65, label %middle.block31, label %vector.body30, !llvm.loop !8

middle.block31:                                   ; preds = %vector.body30
  %cmp.n42 = icmp eq i64 %n.mod.vf35, 0
  br i1 %cmp.n42, label %.lr.ph8.us25.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %middle.block31, %min.iters.checked34, %.prol.loopexit..lr.ph.us.new_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %.prol.loopexit..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr, %min.iters.checked34 ], [ %ind.end, %middle.block31 ]
  br label %.lr.ph.us.new

.lr.ph8.us25.preheader.loopexit:                  ; preds = %.lr.ph.us.new
  br label %.lr.ph8.us25.preheader

.lr.ph8.us25.preheader:                           ; preds = %.lr.ph8.us25.preheader.loopexit, %middle.block31, %.prol.loopexit
  %min.iters.check = icmp ult i64 %34, 2
  %n.vec = and i64 %34, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %34, %n.vec
  br label %.lr.ph8.us25

.lr.ph8.us25:                                     ; preds = %.lr.ph8.us25.preheader, %.loopexit
  %indvars.iv43 = phi i64 [ 0, %.lr.ph8.us25.preheader ], [ %indvars.iv.next44, %.loopexit ]
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv43
  %66 = add i64 %indvars.iv43, 1
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %66
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv43
  %scevgep12 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv50, i64 %66
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv43
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv43
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph8.us25
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %68
  %bound1 = icmp ult double* %68, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound015 = icmp ult double* %scevgep, %scevgep8
  %bound116 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict17 = and i1 %bound015, %bound116
  %conflict.rdx = or i1 %found.conflict, %found.conflict17
  %bound018 = icmp ult double* %scevgep, %scevgep12
  %bound119 = icmp ult double* %scevgep10, %scevgep4
  %found.conflict20 = and i1 %bound018, %bound119
  %conflict.rdx21 = or i1 %conflict.rdx, %found.conflict20
  %bound024 = icmp ult double* %scevgep, %67
  %bound125 = icmp ult double* %67, %scevgep4
  %found.conflict26 = and i1 %bound024, %bound125
  %conflict.rdx27 = or i1 %conflict.rdx21, %found.conflict26
  br i1 %conflict.rdx27, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %69 = or i64 %index, 1
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv43
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %69, i64 %indvars.iv43
  %72 = load double, double* %70, align 8, !alias.scope !9
  %73 = load double, double* %71, align 8, !alias.scope !9
  %74 = insertelement <2 x double> undef, double %72, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fmul <2 x double> %75, %broadcast.splat29
  %77 = load double, double* %67, align 8, !alias.scope !12
  %78 = insertelement <2 x double> undef, double %77, i32 0
  %79 = shufflevector <2 x double> %78, <2 x double> undef, <2 x i32> zeroinitializer
  %80 = fmul <2 x double> %76, %79
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv43
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %69, i64 %indvars.iv43
  %83 = load double, double* %81, align 8, !alias.scope !14
  %84 = load double, double* %82, align 8, !alias.scope !14
  %85 = insertelement <2 x double> undef, double %83, i32 0
  %86 = insertelement <2 x double> %85, double %84, i32 1
  %87 = fmul <2 x double> %86, %broadcast.splat29
  %88 = load double, double* %68, align 8, !alias.scope !16
  %89 = insertelement <2 x double> undef, double %88, i32 0
  %90 = shufflevector <2 x double> %89, <2 x double> undef, <2 x i32> zeroinitializer
  %91 = fmul <2 x double> %87, %90
  %92 = fadd <2 x double> %80, %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %index
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !18, !noalias !20
  %95 = fadd <2 x double> %92, %wide.load
  %96 = bitcast double* %93 to <2 x double>*
  store <2 x double> %95, <2 x double>* %96, align 8, !alias.scope !18, !noalias !20
  %index.next = add i64 %index, 2
  %97 = icmp eq i64 %index.next, %n.vec
  br i1 %97, label %middle.block, label %vector.body, !llvm.loop !21

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.loopexit, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph8.us25
  %indvars.iv38.ph = phi i64 [ 0, %.lr.ph8.us25 ], [ 0, %min.iters.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block ]
  br label %scalar.ph

._crit_edge17:                                    ; preds = %.loopexit34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph.us

; <label>:5:                                      ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond9, label %._crit_edge3, label %.lr.ph.us

; <label>:6:                                      ; preds = %.lr.ph.us, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %17, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %5, label %6

.lr.ph.us:                                        ; preds = %5, %.lr.ph.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next7, %5 ]
  %17 = mul nuw nsw i64 %indvars.iv6, 1200
  br label %6

._crit_edge3:                                     ; preds = %5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !3, !4}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!17}
!17 = distinct !{!17, !11}
!18 = !{!19}
!19 = distinct !{!19, !11}
!20 = !{!17, !10, !15, !13}
!21 = distinct !{!21, !3, !4}
