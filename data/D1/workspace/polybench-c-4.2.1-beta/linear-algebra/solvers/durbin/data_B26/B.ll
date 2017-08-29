; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
.lr.ph:
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %._crit_edge2 ]
  %2 = sub nuw nsw i64 2001, %indvars.iv1
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  store double %4, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %6 = sub i64 2000, %indvars.iv1
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %8, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %10 = sub i64 1999, %indvars.iv1
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %12, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv1, 3
  %14 = sub i64 1998, %indvars.iv1
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %16, double* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv1, 4
  %18 = sub i64 1997, %indvars.iv1
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.3
  store double %20, double* %21, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv1, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
.lr.ph.preheader:
  %3 = alloca [2000 x double], align 16
  %4 = load double, double* %1, align 8
  %5 = fsub double -0.000000e+00, %4
  store double %5, double* %2, align 8
  %6 = load double, double* %1, align 8
  %7 = fsub double -0.000000e+00, %6
  %8 = bitcast double* %2 to i8*
  %9 = bitcast [2000 x double]* %3 to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit, %.lr.ph.preheader
  %indvar = phi i64 [ 0, %.lr.ph.preheader ], [ %51, %.loopexit ]
  %.0426 = phi double [ 1.000000e+00, %.lr.ph.preheader ], [ %55, %.loopexit ]
  %indvars.iv1925 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next20, %.loopexit ]
  %10 = phi double [ %7, %.lr.ph.preheader ], [ %60, %.loopexit ]
  %11 = add i64 %indvar, 1
  %12 = shl i64 %indvar, 3
  %13 = add nsw i64 %indvars.iv1925, -1
  %xtraiter = and i64 %11, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge31.prol.loopexit, label %._crit_edge31.prol.preheader

._crit_edge31.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge31.prol

._crit_edge31.prol:                               ; preds = %._crit_edge31.prol, %._crit_edge31.prol.preheader
  %.022.prol = phi double [ 0.000000e+00, %._crit_edge31.prol.preheader ], [ %20, %._crit_edge31.prol ]
  %indvars.iv21.prol = phi i64 [ 0, %._crit_edge31.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge31.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge31.prol.preheader ], [ %prol.iter.sub, %._crit_edge31.prol ]
  %14 = sub nsw i64 %13, %indvars.iv21.prol
  %15 = getelementptr inbounds double, double* %1, i64 %14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv21.prol
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %.022.prol, %19
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv21.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge31.prol.loopexit.unr-lcssa, label %._crit_edge31.prol, !llvm.loop !1

._crit_edge31.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge31.prol
  br label %._crit_edge31.prol.loopexit

._crit_edge31.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge31.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %20, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %.022.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %20, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %indvars.iv21.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %21 = icmp ult i64 %indvar, 3
  br i1 %21, label %50, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge31.prol.loopexit
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31, %.lr.ph.new
  %.022 = phi double [ %.022.unr, %.lr.ph.new ], [ %49, %._crit_edge31 ]
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge31 ]
  %22 = sub nsw i64 %13, %indvars.iv21
  %23 = getelementptr inbounds double, double* %1, i64 %22
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %.022, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %29 = sub nsw i64 %13, %indvars.iv.next
  %30 = getelementptr inbounds double, double* %1, i64 %29
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %28, %34
  %indvars.iv.next.1 = add nsw i64 %indvars.iv21, 2
  %36 = sub nsw i64 %13, %indvars.iv.next.1
  %37 = getelementptr inbounds double, double* %1, i64 %36
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %35, %41
  %indvars.iv.next.2 = add nsw i64 %indvars.iv21, 3
  %43 = sub nsw i64 %13, %indvars.iv.next.2
  %44 = getelementptr inbounds double, double* %1, i64 %43
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %42, %48
  %indvars.iv.next.3 = add nsw i64 %indvars.iv21, 4
  %exitcond.3 = icmp eq i64 %indvars.iv1925, %indvars.iv.next.3
  br i1 %exitcond.3, label %.unr-lcssa, label %._crit_edge31

.unr-lcssa:                                       ; preds = %._crit_edge31
  br label %50

; <label>:50:                                     ; preds = %._crit_edge31.prol.loopexit, %.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge31.prol.loopexit ], [ %49, %.unr-lcssa ]
  %51 = add nuw nsw i64 %indvar, 1
  %52 = add nuw nsw i64 %12, 8
  %53 = fmul double %10, %10
  %54 = fsub double 1.000000e+00, %53
  %55 = fmul double %54, %.0426
  %56 = getelementptr inbounds double, double* %1, i64 %indvars.iv1925
  %57 = load double, double* %56, align 8
  %58 = fadd double %.lcssa, %57
  %59 = fsub double -0.000000e+00, %58
  %60 = fdiv double %59, %55
  %min.iters.check = icmp ult i64 %51, 4
  br i1 %min.iters.check, label %._crit_edge32.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %50
  %n.vec = and i64 %51, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge32.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert38 = insertelement <2 x double> undef, double %60, i32 0
  %broadcast.splat39 = shufflevector <2 x double> %broadcast.splatinsert38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %61 = getelementptr inbounds double, double* %2, i64 %index
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %62, align 8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %64, align 8
  %65 = sub nsw i64 %13, %index
  %66 = getelementptr inbounds double, double* %2, i64 %65
  %67 = getelementptr double, double* %66, i64 -1
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %68, align 8
  %reverse = shufflevector <2 x double> %wide.load35, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %69 = getelementptr double, double* %66, i64 -2
  %70 = getelementptr double, double* %69, i64 -1
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %71, align 8
  %reverse37 = shufflevector <2 x double> %wide.load36, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %72 = fmul <2 x double> %broadcast.splat39, %reverse
  %73 = fmul <2 x double> %broadcast.splat39, %reverse37
  %74 = fadd <2 x double> %wide.load, %72
  %75 = fadd <2 x double> %wide.load34, %73
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> %74, <2 x double>* %77, align 16
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> %75, <2 x double>* %79, align 16
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %51, %n.vec
  br i1 %cmp.n, label %.loopexit, label %._crit_edge32.preheader

._crit_edge32.preheader:                          ; preds = %middle.block, %min.iters.checked, %50
  %indvars.iv723.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %50 ], [ %n.vec, %middle.block ]
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.preheader, %._crit_edge32
  %indvars.iv723 = phi i64 [ %indvars.iv.next8, %._crit_edge32 ], [ %indvars.iv723.ph, %._crit_edge32.preheader ]
  %81 = getelementptr inbounds double, double* %2, i64 %indvars.iv723
  %82 = load double, double* %81, align 8
  %83 = sub nsw i64 %13, %indvars.iv723
  %84 = getelementptr inbounds double, double* %2, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fmul double %60, %85
  %87 = fadd double %82, %86
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv723
  store double %87, double* %88, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv723, 1
  %exitcond12 = icmp eq i64 %indvars.iv1925, %indvars.iv.next8
  br i1 %exitcond12, label %.loopexit.loopexit, label %._crit_edge32, !llvm.loop !6

.loopexit.loopexit:                               ; preds = %._crit_edge32
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %8, i8* nonnull %9, i64 %52, i32 8, i1 false)
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv1925
  store double %60, double* %89, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1925, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond29, label %._crit_edge28, label %.lr.ph

._crit_edge28:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %indvars.iv1 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
