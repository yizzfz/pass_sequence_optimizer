; ModuleID = 'B.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  call void @init_array(i32 2000, double* %5)
  call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %3 to double*
  %7 = bitcast i8* %4 to double*
  call void @kernel_durbin(i32 2000, double* %6, double* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %8 = icmp sgt i32 %0, 42
  br i1 %8, label %9, label %14

; <label>:9:                                      ; preds = %2
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = bitcast i8* %4 to double*
  call void @print_array(i32 2000, double* %13)
  br label %14

; <label>:14:                                     ; preds = %12, %9, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*) #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %4 = add nsw i32 %0, 1
  %5 = sext i32 %0 to i64
  %6 = add nsw i64 %5, -1
  %xtraiter = and i64 %5, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %7

; <label>:7:                                      ; preds = %7, %.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %.prol.preheader ], [ %indvars.iv.next.prol, %7 ]
  %prol.iter = phi i64 [ %xtraiter, %.prol.preheader ], [ %prol.iter.sub, %7 ]
  %8 = trunc i64 %indvars.iv.prol to i32
  %9 = sub i32 %4, %8
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %10, double* %11, align 8
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %7, !llvm.loop !1

.prol.loopexit.unr-lcssa:                         ; preds = %7
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %6, 3
  br i1 %12, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %13 ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = sub i32 %4, %14
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %16, double* %17, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %19 = sub i32 %4, %18
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %20, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %22 = trunc i64 %indvars.iv.next.1 to i32
  %23 = sub i32 %4, %22
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %24, double* %25, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %26 = trunc i64 %indvars.iv.next.2 to i32
  %27 = sub i32 %4, %26
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %28, double* %29, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %30 = icmp slt i64 %indvars.iv.next.3, %5
  br i1 %30, label %13, label %._crit_edge.loopexit.unr-lcssa

._crit_edge.loopexit.unr-lcssa:                   ; preds = %13
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.unr-lcssa, %.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_durbin(i32, double*, double*) #2 {
  %4 = alloca double*, align 8
  %5 = alloca [2000 x double], align 16
  %6 = alloca double, align 8
  store double* %2, double** %4, align 8
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = load double, double* %1, align 8
  %10 = fsub double -0.000000e+00, %9
  store double %10, double* %6, align 8
  %11 = icmp sgt i32 %0, 1
  br i1 %11, label %.lr.ph19, label %._crit_edge20

.lr.ph19:                                         ; preds = %3
  %12 = sext i32 %0 to i64
  %13 = bitcast [2000 x double]* %5 to i8*
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  br label %15

; <label>:15:                                     ; preds = %._crit_edge15, %.lr.ph19
  %.in = phi double* [ %2, %.lr.ph19 ], [ %91, %._crit_edge15 ]
  %16 = phi double [ 1.000000e+00, %.lr.ph19 ], [ %26, %._crit_edge15 ]
  %17 = phi double [ %10, %.lr.ph19 ], [ %92, %._crit_edge15 ]
  %indvars.iv46 = phi i64 [ 1, %.lr.ph19 ], [ %indvars.iv.next47, %._crit_edge15 ]
  %indvars.iv44 = phi i64 [ 0, %.lr.ph19 ], [ %indvars.iv.next45, %._crit_edge15 ]
  %indvars.iv41 = phi i32 [ 1, %.lr.ph19 ], [ %indvars.iv.next42, %._crit_edge15 ]
  %18 = bitcast double* %.in to i8*
  %19 = trunc i64 %indvars.iv44 to i32
  %20 = shl i64 %indvars.iv44, 3
  %21 = and i64 %20, 34359738360
  %22 = add nuw nsw i64 %21, 8
  %23 = add i32 %19, 1
  %24 = fmul double %17, %17
  %25 = fsub double 1.000000e+00, %24
  %26 = fmul double %16, %25
  %27 = icmp sgt i64 %indvars.iv46, 0
  br i1 %27, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %15
  %xtraiter = and i32 %23, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %28 = shl i64 %indvars.iv46, 32
  %sext52 = add i64 %28, -4294967296
  %29 = ashr exact i64 %sext52, 32
  %30 = getelementptr inbounds double, double* %1, i64 %29
  %31 = load double, double* %30, align 8
  %32 = load double, double* %.in, align 8
  %33 = fmul double %31, %32
  %34 = fadd double %33, 0.000000e+00
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %34, %.prol.preheader ], [ 0.000000e+00, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %34, %.prol.preheader ], [ undef, %.lr.ph ]
  %35 = icmp eq i32 %19, 0
  br i1 %35, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %36 = add nsw i64 %indvars.iv46, 4294967295
  %wide.trip.count.1 = zext i32 %indvars.iv41 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %37 = phi double [ %55, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %38 = sub i64 %36, %indvars.iv
  %sext50 = shl i64 %38, 32
  %39 = ashr exact i64 %sext50, 32
  %40 = getelementptr inbounds double, double* %1, i64 %39
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds double, double* %.in, i64 %indvars.iv
  %43 = bitcast double* %42 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = sub i64 %36, %indvars.iv.next
  %sext51 = shl i64 %44, 32
  %45 = ashr exact i64 %sext51, 32
  %46 = getelementptr inbounds double, double* %1, i64 %45
  %47 = load double, double* %46, align 8
  %48 = load <2 x double>, <2 x double>* %43, align 8
  %49 = insertelement <2 x double> undef, double %41, i32 0
  %50 = insertelement <2 x double> %49, double %47, i32 1
  %51 = fmul <2 x double> %50, %48
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fadd double %37, %52
  %55 = fadd double %54, %53
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %15
  %56 = phi double [ 0.000000e+00, %15 ], [ %.lcssa.unr.ph, %.prol.loopexit ], [ %55, %._crit_edge.loopexit ]
  %57 = icmp sgt i64 %indvars.iv46, 0
  %58 = getelementptr inbounds double, double* %1, i64 %indvars.iv46
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %56
  %61 = fsub double -0.000000e+00, %60
  %62 = fdiv double %61, %26
  store double %62, double* %6, align 8
  br i1 %57, label %.lr.ph11, label %._crit_edge15

.lr.ph11:                                         ; preds = %._crit_edge
  %xtraiter35 = and i32 %23, 1
  %lcmp.mod36 = icmp eq i32 %xtraiter35, 0
  br i1 %lcmp.mod36, label %.prol.loopexit34, label %.prol.preheader33

.prol.preheader33:                                ; preds = %.lr.ph11
  %63 = load double, double* %.in, align 8
  %64 = shl i64 %indvars.iv46, 32
  %sext49 = add i64 %64, -4294967296
  %65 = ashr exact i64 %sext49, 32
  %66 = getelementptr inbounds double, double* %.in, i64 %65
  %67 = load double, double* %66, align 8
  %68 = fmul double %62, %67
  %69 = fadd double %63, %68
  store double %69, double* %14, align 16
  br label %.prol.loopexit34

.prol.loopexit34:                                 ; preds = %.prol.preheader33, %.lr.ph11
  %indvars.iv28.unr.ph = phi i64 [ 1, %.prol.preheader33 ], [ 0, %.lr.ph11 ]
  %70 = icmp eq i32 %19, 0
  br i1 %70, label %._crit_edge15.loopexit, label %.lr.ph11.new.preheader

.lr.ph11.new.preheader:                           ; preds = %.prol.loopexit34
  %wide.trip.count32.1 = zext i32 %indvars.iv41 to i64
  br label %.lr.ph11.new

.lr.ph11.new:                                     ; preds = %.lr.ph11.new, %.lr.ph11.new.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.lr.ph11.new ], [ %indvars.iv28.unr.ph, %.lr.ph11.new.preheader ]
  %71 = getelementptr inbounds double, double* %.in, i64 %indvars.iv28
  %72 = load double, double* %71, align 8
  %73 = xor i64 %indvars.iv28, 4294967295
  %74 = add i64 %indvars.iv46, %73
  %sext = shl i64 %74, 32
  %75 = ashr exact i64 %sext, 32
  %76 = getelementptr inbounds double, double* %.in, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fmul double %62, %77
  %79 = fadd double %72, %78
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv28
  store double %79, double* %80, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %81 = getelementptr inbounds double, double* %.in, i64 %indvars.iv.next29
  %82 = load double, double* %81, align 8
  %83 = sub i64 -2, %indvars.iv28
  %84 = add i64 %indvars.iv46, %83
  %sext48 = shl i64 %84, 32
  %85 = ashr exact i64 %sext48, 32
  %86 = getelementptr inbounds double, double* %.in, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fmul double %62, %87
  %89 = fadd double %82, %88
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next29
  store double %89, double* %90, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond.138 = icmp eq i64 %indvars.iv.next29.1, %wide.trip.count32.1
  br i1 %exitcond.138, label %._crit_edge15.loopexit.loopexit, label %.lr.ph11.new

._crit_edge15.loopexit.loopexit:                  ; preds = %.lr.ph11.new
  br label %._crit_edge15.loopexit

._crit_edge15.loopexit:                           ; preds = %._crit_edge15.loopexit.loopexit, %.prol.loopexit34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* nonnull %13, i64 %22, i32 8, i1 false)
  %.pre58 = load double, double* %6, align 8
  %.pre56 = load double*, double** %4, align 8
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %._crit_edge
  %91 = phi double* [ %.in, %._crit_edge ], [ %.pre56, %._crit_edge15.loopexit ]
  %92 = phi double [ %62, %._crit_edge ], [ %.pre58, %._crit_edge15.loopexit ]
  %93 = getelementptr inbounds double, double* %91, i64 %indvars.iv46
  store double %92, double* %93, align 8
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %indvars.iv.next42 = add i32 %indvars.iv41, 1
  %94 = icmp slt i64 %indvars.iv.next47, %12
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br i1 %94, label %15, label %._crit_edge20.loopexit

._crit_edge20.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %15, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %9
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %20 = icmp slt i64 %indvars.iv.next, %8
  br i1 %20, label %9, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %15
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
