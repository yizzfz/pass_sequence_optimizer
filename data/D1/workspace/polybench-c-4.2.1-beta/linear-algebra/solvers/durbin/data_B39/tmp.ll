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
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #0 {
.lr.ph17.preheader:
  %3 = bitcast double* %2 to i8*
  %4 = alloca [2000 x double], align 16
  %5 = bitcast [2000 x double]* %4 to i8*
  %6 = load double, double* %1, align 8
  %7 = fsub double -0.000000e+00, %6
  store double %7, double* %2, align 8
  %8 = load double, double* %1, align 8
  %9 = fsub double -0.000000e+00, %8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 0
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12..lr.ph_crit_edge, %.lr.ph17.preheader
  %indvars.iv33 = phi i64 [ 1, %.lr.ph17.preheader ], [ %indvars.iv.next34, %._crit_edge12..lr.ph_crit_edge ]
  %indvar = phi i64 [ 0, %.lr.ph17.preheader ], [ %indvar.next, %._crit_edge12..lr.ph_crit_edge ]
  %.0314 = phi double [ %9, %.lr.ph17.preheader ], [ %57, %._crit_edge12..lr.ph_crit_edge ]
  %.0413 = phi double [ 1.000000e+00, %.lr.ph17.preheader ], [ %52, %._crit_edge12..lr.ph_crit_edge ]
  %11 = add i64 %indvar, 1
  %12 = shl i64 %indvar, 3
  %13 = fmul double %.0314, %.0314
  %14 = fsub double 1.000000e+00, %13
  %15 = add nsw i64 %indvars.iv33, -1
  %xtraiter = and i64 %11, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge37.prol.loopexit, label %._crit_edge37.prol.preheader

._crit_edge37.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge37.prol

._crit_edge37.prol:                               ; preds = %._crit_edge37.prol, %._crit_edge37.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge37.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge37.prol ]
  %.025.prol = phi double [ 0.000000e+00, %._crit_edge37.prol.preheader ], [ %22, %._crit_edge37.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge37.prol.preheader ], [ %prol.iter.sub, %._crit_edge37.prol ]
  %16 = sub nsw i64 %15, %indvars.iv.prol
  %17 = getelementptr inbounds double, double* %1, i64 %16
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %.025.prol, %21
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge37.prol.loopexit.unr-lcssa, label %._crit_edge37.prol, !llvm.loop !1

._crit_edge37.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge37.prol
  br label %._crit_edge37.prol.loopexit

._crit_edge37.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge37.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %22, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %22, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %23 = icmp ult i64 %indvar, 3
  br i1 %23, label %.lr.ph9, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge37.prol.loopexit
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge37 ]
  %.025 = phi double [ %.025.unr, %.lr.ph.new ], [ %51, %._crit_edge37 ]
  %24 = sub nsw i64 %15, %indvars.iv
  %25 = getelementptr inbounds double, double* %1, i64 %24
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %.025, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = sub nsw i64 %15, %indvars.iv.next
  %32 = getelementptr inbounds double, double* %1, i64 %31
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %30, %36
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = sub nsw i64 %15, %indvars.iv.next.1
  %39 = getelementptr inbounds double, double* %1, i64 %38
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %37, %43
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %45 = sub nsw i64 %15, %indvars.iv.next.2
  %46 = getelementptr inbounds double, double* %1, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %44, %50
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv33
  br i1 %exitcond.3, label %.lr.ph9.unr-lcssa, label %._crit_edge37

.lr.ph9.unr-lcssa:                                ; preds = %._crit_edge37
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %._crit_edge37.prol.loopexit, %.lr.ph9.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge37.prol.loopexit ], [ %51, %.lr.ph9.unr-lcssa ]
  %52 = fmul double %.0413, %14
  %53 = getelementptr inbounds double, double* %1, i64 %indvars.iv33
  %54 = load double, double* %53, align 8
  %55 = fadd double %.lcssa, %54
  %56 = fsub double -0.000000e+00, %55
  %57 = fdiv double %56, %52
  %58 = and i64 %indvar, 1
  %lcmp.mod40 = icmp eq i64 %58, 0
  br i1 %lcmp.mod40, label %._crit_edge38.prol.preheader, label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.preheader:                     ; preds = %.lr.ph9
  br label %._crit_edge38.prol

._crit_edge38.prol:                               ; preds = %._crit_edge38.prol.preheader
  %59 = load double, double* %2, align 8
  %60 = getelementptr inbounds double, double* %2, i64 %15
  %61 = load double, double* %60, align 8
  %62 = fmul double %57, %61
  %63 = fadd double %59, %62
  store double %63, double* %10, align 16
  br label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph9, %._crit_edge38.prol
  %indvars.iv21.unr.ph = phi i64 [ 1, %._crit_edge38.prol ], [ 0, %.lr.ph9 ]
  br label %._crit_edge38.prol.loopexit

._crit_edge38.prol.loopexit:                      ; preds = %._crit_edge38.prol.loopexit.unr-lcssa
  %64 = icmp eq i64 %indvar, 0
  br i1 %64, label %._crit_edge12, label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %._crit_edge38.prol.loopexit
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38, %.lr.ph9.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %.lr.ph9.new ], [ %indvars.iv.next22.1, %._crit_edge38 ]
  %65 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %66 = load double, double* %65, align 8
  %67 = sub nsw i64 %15, %indvars.iv21
  %68 = getelementptr inbounds double, double* %2, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fmul double %57, %69
  %71 = fadd double %66, %70
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv21
  store double %71, double* %72, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %73 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next22
  %74 = load double, double* %73, align 8
  %75 = sub nsw i64 %15, %indvars.iv.next22
  %76 = getelementptr inbounds double, double* %2, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fmul double %57, %77
  %79 = fadd double %74, %78
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv.next22
  store double %79, double* %80, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv33
  br i1 %exitcond26.1, label %._crit_edge12.unr-lcssa, label %._crit_edge38

._crit_edge12.unr-lcssa:                          ; preds = %._crit_edge38
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge38.prol.loopexit, %._crit_edge12.unr-lcssa
  %81 = add nuw nsw i64 %12, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %3, i8* nonnull %5, i64 %81, i32 8, i1 false)
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv33
  store double %57, double* %82, align 8
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond36 = icmp eq i64 %indvar.next, 1999
  br i1 %exitcond36, label %._crit_edge18, label %._crit_edge12..lr.ph_crit_edge

._crit_edge12..lr.ph_crit_edge:                   ; preds = %._crit_edge12
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br label %.lr.ph

._crit_edge18:                                    ; preds = %._crit_edge12
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

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
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
