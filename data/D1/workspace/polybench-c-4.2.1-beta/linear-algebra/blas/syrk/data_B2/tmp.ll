; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.lr.ph
  %indvars.iv23 = phi i64 [ 0, %.preheader4.lr.ph ], [ %indvars.iv.next24, %._crit_edge11.us ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %12, double* %13, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond29, label %._crit_edge11.us, label %6

._crit_edge11.us:                                 ; preds = %6
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond30, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %15 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %16 = add nuw nsw i64 %15, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond28, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond, label %._crit_edge8, label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.lr.ph:
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader95, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader95 ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %3
  store double %8, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.2
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv47
  br i1 %exitcond46.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us15.new:                              ; preds = %.preheader.us15.new.preheader, %.preheader.us15.new
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %.preheader.us15.new ], [ %indvars.iv23.unr.ph, %.preheader.us15.new.preheader ]
  %18 = load double, double* %34, align 8
  %19 = fmul double %18, %2
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv27
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv23
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %23, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %26 = load double, double* %34, align 8
  %27 = fmul double %26, %2
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next24, i64 %indvars.iv27
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next24
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next24.1 = add nuw nsw i64 %indvars.iv23, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next24.1, %indvars.iv47
  br i1 %exitcond.1, label %._crit_edge.us18.loopexit, label %.preheader.us15.new

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv27
  br i1 %lcmp.mod52, label %.prol.preheader49, label %.prol.loopexit50

.prol.preheader49:                                ; preds = %.preheader.us15
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %2
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv27
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %72, align 8
  %41 = fadd double %40, %39
  store double %41, double* %72, align 8
  br label %.prol.loopexit50

.prol.loopexit50:                                 ; preds = %.prol.preheader49, %.preheader.us15
  %indvars.iv23.unr.ph = phi i64 [ 1, %.prol.preheader49 ], [ 0, %.preheader.us15 ]
  br i1 %73, label %._crit_edge.us18, label %.preheader.us15.new.preheader

.preheader.us15.new.preheader:                    ; preds = %.prol.loopexit50
  br label %.preheader.us15.new

.lr.ph.us:                                        ; preds = %.preheader4.lr.ph, %._crit_edge9.us
  %indvars.iv96 = phi i2 [ 1, %.preheader4.lr.ph ], [ %indvars.iv.next97, %._crit_edge9.us ]
  %indvars.iv53 = phi i64 [ 0, %.preheader4.lr.ph ], [ %44, %._crit_edge9.us ]
  %indvars.iv47 = phi i64 [ 1, %.preheader4.lr.ph ], [ %indvars.iv.next48, %._crit_edge9.us ]
  %42 = zext i2 %indvars.iv96 to i64
  %43 = add nsw i64 %indvars.iv53, -3
  %44 = add nuw nsw i64 %indvars.iv53, 1
  %xtraiter = and i64 %44, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.prol
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %3
  store double %47, double* %45, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %42, %.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %indvars.iv53, 3
  br i1 %48, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %49 = sub i64 %43, %indvars.iv.unr
  %50 = lshr i64 %49, 2
  %51 = add nuw nsw i64 %50, 1
  %min.iters.check72 = icmp ult i64 %51, 2
  br i1 %min.iters.check72, label %.lr.ph.us.new.preheader95, label %min.iters.checked73

.lr.ph.us.new.preheader95:                        ; preds = %middle.block70, %min.iters.checked73, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked73 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end81, %middle.block70 ]
  br label %.lr.ph.us.new

min.iters.checked73:                              ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf74 = and i64 %51, 1
  %n.vec75 = sub nsw i64 %51, %n.mod.vf74
  %cmp.zero76 = icmp eq i64 %n.vec75, 0
  %52 = or i64 %indvars.iv.unr, 4
  %53 = shl nuw i64 %50, 2
  %54 = add i64 %52, %53
  %55 = shl nuw nsw i64 %n.mod.vf74, 2
  %ind.end81 = sub i64 %54, %55
  br i1 %cmp.zero76, label %.lr.ph.us.new.preheader95, label %vector.ph77

vector.ph77:                                      ; preds = %min.iters.checked73
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69, %vector.ph77
  %index78 = phi i64 [ 0, %vector.ph77 ], [ %index.next79, %vector.body69 ]
  %56 = shl i64 %index78, 2
  %57 = or i64 %indvars.iv.unr, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %57
  %59 = bitcast double* %58 to <8 x double>*
  %wide.vec87 = load <8 x double>, <8 x double>* %59, align 8
  %strided.vec88 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec89 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec90 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec91 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %60 = fmul <2 x double> %strided.vec88, %broadcast.splat93
  %61 = fmul <2 x double> %strided.vec89, %broadcast.splat93
  %62 = fmul <2 x double> %strided.vec90, %broadcast.splat93
  %63 = add nsw i64 %57, 3
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %63
  %65 = fmul <2 x double> %strided.vec91, %broadcast.splat93
  %66 = getelementptr double, double* %64, i64 -3
  %67 = bitcast double* %66 to <8 x double>*
  %68 = shufflevector <2 x double> %60, <2 x double> %61, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %69 = shufflevector <2 x double> %62, <2 x double> %65, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec94 = shufflevector <4 x double> %68, <4 x double> %69, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec94, <8 x double>* %67, align 8
  %index.next79 = add i64 %index78, 2
  %70 = icmp eq i64 %index.next79, %n.vec75
  br i1 %70, label %middle.block70, label %vector.body69, !llvm.loop !7

middle.block70:                                   ; preds = %vector.body69
  %cmp.n82 = icmp eq i64 %n.mod.vf74, 0
  br i1 %cmp.n82, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader95

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block70, %.prol.loopexit
  %71 = and i64 %indvars.iv53, 1
  %lcmp.mod52 = icmp eq i64 %71, 0
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 0
  %73 = icmp eq i64 %indvars.iv53, 0
  br label %.preheader.us15

._crit_edge.us18.loopexit:                        ; preds = %.preheader.us15.new
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %.prol.loopexit50
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond55 = icmp eq i64 %44, 1200
  %indvars.iv.next97 = add i2 %indvars.iv96, 1
  br i1 %exitcond55, label %._crit_edge13, label %.lr.ph.us

._crit_edge13:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond9, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
