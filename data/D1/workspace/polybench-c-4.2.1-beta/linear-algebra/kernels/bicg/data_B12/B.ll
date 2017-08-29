; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %11, double* %12)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1900 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph9, label %.preheader

.lr.ph9:                                          ; preds = %5
  %7 = sitofp i32 %0 to double
  %8 = and i32 %0, 1
  %lcmp.mod28 = icmp eq i32 %8, 0
  br i1 %lcmp.mod28, label %.prol.loopexit26, label %.prol.preheader25

.prol.preheader25:                                ; preds = %.lr.ph9
  %9 = fdiv double 0.000000e+00, %7
  store double %9, double* %4, align 8
  br label %.prol.loopexit26

.prol.loopexit26:                                 ; preds = %.lr.ph9, %.prol.preheader25
  %indvars.iv19.unr = phi i64 [ 0, %.lr.ph9 ], [ 1, %.prol.preheader25 ]
  %10 = icmp eq i32 %0, 1
  br i1 %10, label %.preheader, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit26
  %wide.trip.count21.1 = zext i32 %0 to i64
  br label %.lr.ph9.new

.preheader.loopexit:                              ; preds = %.lr.ph9.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit26, %5
  %11 = icmp sgt i32 %1, 0
  br i1 %11, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  %12 = sitofp i32 %1 to double
  br i1 %6, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %13 = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %13, 0
  %14 = icmp eq i32 %0, 1
  %wide.trip.count13 = zext i32 %1 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  %15 = and i32 %1, 1
  %lcmp.mod24 = icmp eq i32 %15, 0
  br i1 %lcmp.mod24, label %.lr.ph5.split.prol.loopexit, label %.lr.ph5.split.prol

.lr.ph5.split.prol:                               ; preds = %.lr.ph5.split.preheader
  %16 = fdiv double 0.000000e+00, %12
  store double %16, double* %3, align 8
  br label %.lr.ph5.split.prol.loopexit

.lr.ph5.split.prol.loopexit:                      ; preds = %.lr.ph5.split.preheader, %.lr.ph5.split.prol
  %indvars.iv15.unr = phi i64 [ 0, %.lr.ph5.split.preheader ], [ 1, %.lr.ph5.split.prol ]
  %17 = icmp eq i32 %1, 1
  br i1 %17, label %._crit_edge6, label %.lr.ph5.split.preheader29

.lr.ph5.split.preheader29:                        ; preds = %.lr.ph5.split.prol.loopexit
  %wide.trip.count17.1 = zext i32 %1 to i64
  br label %.lr.ph5.split

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %18 = trunc i64 %indvars.iv11 to i32
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %12
  %21 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  store double %20, double* %21, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph5.split.us
  %22 = srem i32 %18, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %12
  %25 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 0
  store double %24, double* %25, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph5.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph5.split.us ]
  br i1 %14, label %._crit_edge.us, label %.lr.ph5.split.us.new.preheader

.lr.ph5.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph5.split.us.new

.lr.ph5.split.us.new:                             ; preds = %.lr.ph5.split.us.new.preheader, %.lr.ph5.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph5.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph5.split.us.new.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %12
  %31 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %32 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv11
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %12
  %37 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %36, double* %37, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph5.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph5.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond14, label %._crit_edge6.loopexit, label %.lr.ph5.split.us

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader, %.lr.ph9.new
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.1, %.lr.ph9.new ], [ %indvars.iv19.unr, %.lr.ph9.new.preheader ]
  %38 = trunc i64 %indvars.iv19 to i32
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %7
  %41 = getelementptr inbounds double, double* %4, i64 %indvars.iv19
  store double %40, double* %41, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %42 = trunc i64 %indvars.iv.next20 to i32
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %7
  %45 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next20
  store double %44, double* %45, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next20.1, %wide.trip.count21.1
  br i1 %exitcond22.1, label %.preheader.loopexit, label %.lr.ph9.new

.lr.ph5.split:                                    ; preds = %.lr.ph5.split.preheader29, %.lr.ph5.split
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.lr.ph5.split ], [ %indvars.iv15.unr, %.lr.ph5.split.preheader29 ]
  %46 = trunc i64 %indvars.iv15 to i32
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %12
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  store double %48, double* %49, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %50 = trunc i64 %indvars.iv.next16 to i32
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %12
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  store double %52, double* %53, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, %wide.trip.count17.1
  br i1 %exitcond18.1, label %._crit_edge6.loopexit32, label %.lr.ph5.split

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6.loopexit32:                          ; preds = %.lr.ph5.split
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit32, %._crit_edge6.loopexit, %.lr.ph5.split.prol.loopexit, %.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32, i32, [1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %8 = bitcast double* %4 to i8*
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader.loopexit, label %.preheader

.preheader.loopexit:                              ; preds = %7
  %10 = bitcast double* %3 to i8*
  %11 = zext i32 %0 to i64
  %12 = shl nuw nsw i64 %11, 3
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 %12, i32 8, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %7
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %.preheader
  %sunkaddr = ptrtoint double* %4 to i64
  br i1 %9, label %.lr.ph7.split.us.preheader, label %._crit_edge8.loopexit12

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count15 = zext i32 %1 to i64
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %14 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  store double 0.000000e+00, double* %14, align 8
  %15 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %sunkaddr2.us = shl nsw i64 %indvars.iv13, 3
  %sunkaddr3.us = add i64 %sunkaddr2.us, %sunkaddr
  %sunkaddr4.us = inttoptr i64 %sunkaddr3.us to double*
  br label %16

; <label>:16:                                     ; preds = %16, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next, %16 ]
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = load double, double* %15, align 8
  %20 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  store double %23, double* %17, align 8
  %24 = load double, double* %sunkaddr4.us, align 8
  %25 = load double, double* %20, align 8
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %24, %28
  store double %29, double* %sunkaddr4.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %16

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge8.loopexit, label %.lr.ph7.split.us

._crit_edge8.loopexit12:                          ; preds = %.lr.ph7
  %30 = zext i32 %1 to i64
  %31 = shl nuw nsw i64 %30, 3
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %31, i32 8, i1 false)
  br label %._crit_edge8

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge8.loopexit12, %.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %4
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %15
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

.lr.ph:                                           ; preds = %.lr.ph.preheader, %30
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
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
