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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #3
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*) unnamed_addr #0 {
.lr.ph:
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %._crit_edge2 ]
  %2 = trunc i64 %indvars.iv to i32
  %3 = sub nuw nsw i32 2001, %2
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %4, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = trunc i64 %indvars.iv.next to i32
  %7 = sub nuw nsw i32 2001, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %8, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %10 = trunc i64 %indvars.iv.next.1 to i32
  %11 = sub nuw nsw i32 2001, %10
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %12, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %14 = trunc i64 %indvars.iv.next.2 to i32
  %15 = sub nuw nsw i32 2001, %14
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %16, double* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %18 = trunc i64 %indvars.iv.next.3 to i32
  %19 = sub nuw nsw i32 2001, %18
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.3
  store double %20, double* %21, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double*, double*) unnamed_addr #0 {
.lr.ph26.preheader:
  %3 = bitcast double* %2 to i8*
  %4 = alloca [2000 x double], align 16
  %5 = bitcast [2000 x double]* %4 to i8*
  %6 = load double, double* %1, align 8
  %7 = fsub double -0.000000e+00, %6
  store double %7, double* %2, align 8
  %8 = load double, double* %1, align 8
  %9 = fsub double -0.000000e+00, %8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge._crit_edge, %.lr.ph26.preheader
  %indvars.iv46 = phi i64 [ 1, %.lr.ph26.preheader ], [ %indvars.iv.next47, %._crit_edge._crit_edge ]
  %indvar = phi i64 [ 0, %.lr.ph26.preheader ], [ %55, %._crit_edge._crit_edge ]
  %10 = phi double [ %9, %.lr.ph26.preheader ], [ %62, %._crit_edge._crit_edge ]
  %11 = phi double [ 1.000000e+00, %.lr.ph26.preheader ], [ %57, %._crit_edge._crit_edge ]
  %12 = add i64 %indvar, 1
  %13 = shl i64 %indvar, 3
  %14 = fmul double %10, %10
  %15 = fsub double 1.000000e+00, %14
  %16 = add nsw i64 %indvars.iv46, -1
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge51.prol.loopexit, label %._crit_edge51.prol.preheader

._crit_edge51.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge51.prol

._crit_edge51.prol:                               ; preds = %._crit_edge51.prol, %._crit_edge51.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge51.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge51.prol ]
  %17 = phi double [ 0.000000e+00, %._crit_edge51.prol.preheader ], [ %24, %._crit_edge51.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge51.prol.preheader ], [ %prol.iter.sub, %._crit_edge51.prol ]
  %18 = sub nsw i64 %16, %indvars.iv.prol
  %19 = getelementptr inbounds double, double* %1, i64 %18
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %17, %23
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge51.prol.loopexit.unr-lcssa, label %._crit_edge51.prol, !llvm.loop !1

._crit_edge51.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge51.prol
  br label %._crit_edge51.prol.loopexit

._crit_edge51.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge51.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %24, %._crit_edge51.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge51.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %24, %._crit_edge51.prol.loopexit.unr-lcssa ]
  %25 = icmp ult i64 %indvar, 3
  br i1 %25, label %.lr.ph18, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge51.prol.loopexit
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge51 ]
  %26 = phi double [ %.unr, %.lr.ph.new ], [ %54, %._crit_edge51 ]
  %27 = sub nsw i64 %16, %indvars.iv
  %28 = getelementptr inbounds double, double* %1, i64 %27
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %26, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = sub nsw i64 %16, %indvars.iv.next
  %35 = getelementptr inbounds double, double* %1, i64 %34
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %33, %39
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %41 = sub nsw i64 %16, %indvars.iv.next.1
  %42 = getelementptr inbounds double, double* %1, i64 %41
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %40, %46
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %48 = sub nsw i64 %16, %indvars.iv.next.2
  %49 = getelementptr inbounds double, double* %1, i64 %48
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %47, %53
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv46
  br i1 %exitcond.3, label %.lr.ph18.unr-lcssa, label %._crit_edge51

.lr.ph18.unr-lcssa:                               ; preds = %._crit_edge51
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %._crit_edge51.prol.loopexit, %.lr.ph18.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge51.prol.loopexit ], [ %54, %.lr.ph18.unr-lcssa ]
  %55 = add nuw nsw i64 %indvar, 1
  %56 = add nuw nsw i64 %13, 8
  %57 = fmul double %11, %15
  %58 = getelementptr inbounds double, double* %1, i64 %indvars.iv46
  %59 = load double, double* %58, align 8
  %60 = fadd double %.lcssa, %59
  %61 = fsub double -0.000000e+00, %60
  %62 = fdiv double %61, %57
  %min.iters.check = icmp ult i64 %55, 4
  br i1 %min.iters.check, label %._crit_edge52.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph18
  %n.vec = and i64 %55, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge52.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %62, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %63 = getelementptr inbounds double, double* %2, i64 %index
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %66, align 8
  %67 = sub nsw i64 %16, %index
  %68 = getelementptr inbounds double, double* %2, i64 %67
  %69 = getelementptr double, double* %68, i64 -1
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %70, align 8
  %reverse = shufflevector <2 x double> %wide.load55, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %71 = getelementptr double, double* %68, i64 -2
  %72 = getelementptr double, double* %71, i64 -1
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %73, align 8
  %reverse57 = shufflevector <2 x double> %wide.load56, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %74 = fmul <2 x double> %broadcast.splat59, %reverse
  %75 = fmul <2 x double> %broadcast.splat59, %reverse57
  %76 = fadd <2 x double> %wide.load, %74
  %77 = fadd <2 x double> %wide.load54, %75
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %index
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> %76, <2 x double>* %79, align 16
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> %77, <2 x double>* %81, align 16
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, %n.vec
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %55, %n.vec
  br i1 %cmp.n, label %._crit_edge._crit_edge, label %._crit_edge52.preheader

._crit_edge52.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph18
  %indvars.iv34.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph18 ], [ %n.vec, %middle.block ]
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge52.preheader, %._crit_edge52
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge52 ], [ %indvars.iv34.ph, %._crit_edge52.preheader ]
  %83 = getelementptr inbounds double, double* %2, i64 %indvars.iv34
  %84 = load double, double* %83, align 8
  %85 = sub nsw i64 %16, %indvars.iv34
  %86 = getelementptr inbounds double, double* %2, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fmul double %62, %87
  %89 = fadd double %84, %88
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv34
  store double %89, double* %90, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv46
  br i1 %exitcond39, label %._crit_edge._crit_edge.loopexit, label %._crit_edge52, !llvm.loop !6

._crit_edge._crit_edge.loopexit:                  ; preds = %._crit_edge52
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge._crit_edge.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %3, i8* nonnull %5, i64 %56, i32 8, i1 false)
  %91 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  store double %62, double* %91, align 8
  %exitcond49 = icmp eq i64 %55, 1999
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  br i1 %exitcond49, label %._crit_edge27, label %.lr.ph

._crit_edge27:                                    ; preds = %._crit_edge._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge2, label %.lr.ph

._crit_edge2:                                     ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
