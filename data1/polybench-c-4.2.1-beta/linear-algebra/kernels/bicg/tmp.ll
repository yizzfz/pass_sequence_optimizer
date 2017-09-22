; ModuleID = 'B.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 1900, i32 2100, [1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to double*
  %19 = bitcast i8* %4 to double*
  tail call void @print_array(i32 1900, i32 2100, double* %19, double* %18)
  br label %20

; <label>:20:                                     ; preds = %17, %14, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [1900 x double]* nocapture, double* nocapture, double* nocapture) #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph9, label %.preheader

.lr.ph9:                                          ; preds = %5
  %7 = sitofp i32 %0 to double
  %xtraiter26 = and i32 %0, 1
  %lcmp.mod27 = icmp eq i32 %xtraiter26, 0
  br i1 %lcmp.mod27, label %.prol.loopexit25, label %.prol.preheader24

.prol.preheader24:                                ; preds = %.lr.ph9
  %8 = fdiv double 0.000000e+00, %7
  store double %8, double* %4, align 8
  br label %.prol.loopexit25

.prol.loopexit25:                                 ; preds = %.prol.preheader24, %.lr.ph9
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph9 ], [ 1, %.prol.preheader24 ]
  %9 = icmp eq i32 %0, 1
  br i1 %9, label %.preheader, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit25
  %wide.trip.count22.1 = zext i32 %0 to i64
  br label %.lr.ph9.new

.preheader.loopexit:                              ; preds = %.lr.ph9.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit25, %5
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  %11 = sitofp i32 %1 to double
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %0, 1
  %wide.trip.count13 = zext i32 %1 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  %xtraiter18 = and i32 %1, 1
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  br i1 %lcmp.mod19, label %.lr.ph5.split.prol.loopexit, label %.lr.ph5.split.prol

.lr.ph5.split.prol:                               ; preds = %.lr.ph5.split.preheader
  %14 = fdiv double 0.000000e+00, %11
  store double %14, double* %3, align 8
  br label %.lr.ph5.split.prol.loopexit

.lr.ph5.split.prol.loopexit:                      ; preds = %.lr.ph5.split.prol, %.lr.ph5.split.preheader
  %indvars.iv14.unr = phi i64 [ 0, %.lr.ph5.split.preheader ], [ 1, %.lr.ph5.split.prol ]
  %15 = icmp eq i32 %1, 1
  br i1 %15, label %._crit_edge6, label %.lr.ph5.split.preheader28

.lr.ph5.split.preheader28:                        ; preds = %.lr.ph5.split.prol.loopexit
  %wide.trip.count16.1 = zext i32 %1 to i64
  br label %.lr.ph5.split

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %16 = trunc i64 %indvars.iv11 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %11
  %19 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  store double %18, double* %19, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph5.split.us
  %20 = trunc i64 %indvars.iv11 to i32
  %21 = srem i32 %20, %1
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %11
  %24 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 0
  store double %23, double* %24, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph5.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph5.split.us ]
  br i1 %13, label %._crit_edge.us, label %.lr.ph5.split.us.new.preheader

.lr.ph5.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph5.split.us.new

.lr.ph5.split.us.new:                             ; preds = %.lr.ph5.split.us.new, %.lr.ph5.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph5.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph5.split.us.new.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, %1
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, %11
  %30 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  store double %29, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %31 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv11
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %11
  %36 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %35, double* %36, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph5.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph5.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond, label %._crit_edge6.loopexit, label %.lr.ph5.split.us

.lr.ph9.new:                                      ; preds = %.lr.ph9.new, %.lr.ph9.new.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %.lr.ph9.new ], [ %indvars.iv20.unr, %.lr.ph9.new.preheader ]
  %37 = trunc i64 %indvars.iv20 to i32
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %7
  %40 = getelementptr inbounds double, double* %4, i64 %indvars.iv20
  store double %39, double* %40, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %41 = trunc i64 %indvars.iv.next21 to i32
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %7
  %44 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next21
  store double %43, double* %44, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next21.1, %wide.trip.count22.1
  br i1 %exitcond23.1, label %.preheader.loopexit, label %.lr.ph9.new

.lr.ph5.split:                                    ; preds = %.lr.ph5.split, %.lr.ph5.split.preheader28
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.1, %.lr.ph5.split ], [ %indvars.iv14.unr, %.lr.ph5.split.preheader28 ]
  %45 = trunc i64 %indvars.iv14 to i32
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %11
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  store double %47, double* %48, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %49 = trunc i64 %indvars.iv.next15 to i32
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, %11
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15
  store double %51, double* %52, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next15.1, %wide.trip.count16.1
  br i1 %exitcond17.1, label %._crit_edge6.loopexit32, label %.lr.ph5.split

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6.loopexit32:                          ; preds = %.lr.ph5.split
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit32, %._crit_edge6.loopexit, %.lr.ph5.split.prol.loopexit, %.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_bicg(i32, i32, [1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.loopexit, label %.preheader

.preheader.loopexit:                              ; preds = %7
  %9 = bitcast double* %3 to i8*
  %10 = add i32 %0, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %13, i32 8, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %7
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph4, label %._crit_edge5

.lr.ph4:                                          ; preds = %.preheader
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.lr.ph4.split.us.preheader, label %._crit_edge5.loopexit9

.lr.ph4.split.us.preheader:                       ; preds = %.lr.ph4
  %sunkaddr = ptrtoint double* %6 to i64
  %sunkaddr25 = ptrtoint double* %4 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count12 = zext i32 %1 to i64
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv10
  store double 0.000000e+00, double* %16, align 8
  %sunkaddr22 = shl i64 %indvars.iv10, 3
  %sunkaddr23 = add i64 %sunkaddr, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  %sunkaddr26 = shl i64 %indvars.iv10, 3
  %sunkaddr27 = add i64 %sunkaddr25, %sunkaddr26
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to double*
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %17 ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = load double, double* %sunkaddr24, align 8
  %21 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %19, %23
  store double %24, double* %18, align 8
  %25 = load double, double* %sunkaddr28, align 8
  %26 = load double, double* %21, align 8
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %25, %29
  store double %30, double* %sunkaddr28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %._crit_edge5.loopexit, label %.lr.ph4.split.us

._crit_edge5.loopexit9:                           ; preds = %.lr.ph4
  %31 = bitcast double* %4 to i8*
  %32 = add i32 %1, -1
  %33 = zext i32 %32 to i64
  %34 = shl nuw nsw i64 %33, 3
  %35 = add nuw nsw i64 %34, 8
  call void @llvm.memset.p0i8.i64(i8* %31, i8 0, i64 %35, i32 8, i1 false)
  br label %._crit_edge5

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge5.loopexit9, %.preheader
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, double* nocapture readonly, double* nocapture readonly) #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %4
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %15, %.lr.ph7.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %15 ], [ 0, %.lr.ph7.preheader ]
  %10 = trunc i64 %indvars.iv9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %.lr.ph7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %.lr.ph7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv9
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge8.loopexit, label %.lr.ph7

._crit_edge8.loopexit:                            ; preds = %15
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %24 = icmp sgt i32 %1, 0
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge8
  %wide.trip.count = zext i32 %1 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %30, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %30 ], [ 0, %.lr.ph.preheader ]
  %25 = trunc i64 %indvars.iv to i32
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %.lr.ph
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %29) #6
  br label %30

; <label>:30:                                     ; preds = %28, %.lr.ph
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %30
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge8
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %37) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
