; ModuleID = 'B.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %18, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge28.us, %._crit_edge.lr.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge28.us ], [ 0, %._crit_edge.lr.ph ]
  br label %10

; <label>:10:                                     ; preds = %10, %._crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %10 ], [ 0, %._crit_edge.us ]
  %11 = mul nuw nsw i64 %indvars.iv58, %indvars.iv62
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv62, i64 %indvars.iv58
  store double %16, double* %17, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next59, 1100
  br i1 %exitcond78, label %._crit_edge28.us, label %10

._crit_edge28.us:                                 ; preds = %10
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next63, 800
  br i1 %exitcond80, label %._crit_edge6.us.preheader, label %._crit_edge.us

._crit_edge6.us.preheader:                        ; preds = %._crit_edge28.us
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge23.us, %._crit_edge6.us.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge23.us ], [ 0, %._crit_edge6.us.preheader ]
  br label %._crit_edge6.us.new

._crit_edge6.us.new:                              ; preds = %._crit_edge6.us.new, %._crit_edge6.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %._crit_edge6.us.new ], [ 0, %._crit_edge6.us ]
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %18 = mul nuw nsw i64 %indvars.iv.next50, %indvars.iv53
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 9.000000e+02
  %23 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv53, i64 %indvars.iv49
  store double %22, double* %23, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %24 = mul nuw nsw i64 %indvars.iv.next50.1, %indvars.iv53
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 900
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 9.000000e+02
  %29 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv53, i64 %indvars.iv.next50
  store double %28, double* %29, align 8
  %exitcond74.1 = icmp eq i64 %indvars.iv.next50.1, 900
  br i1 %exitcond74.1, label %._crit_edge23.us, label %._crit_edge6.us.new

._crit_edge23.us:                                 ; preds = %._crit_edge6.us.new
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next54, 1100
  br i1 %exitcond76, label %._crit_edge8.us.preheader, label %._crit_edge6.us

._crit_edge8.us.preheader:                        ; preds = %._crit_edge23.us
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge18.us, %._crit_edge8.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge18.us ], [ 0, %._crit_edge8.us.preheader ]
  br label %30

; <label>:30:                                     ; preds = %30, %._crit_edge8.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %30 ], [ 0, %._crit_edge8.us ]
  %31 = add nuw nsw i64 %indvars.iv40, 3
  %32 = mul nuw nsw i64 %31, %indvars.iv44
  %33 = add nuw nsw i64 %32, 1
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 1200
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.200000e+03
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv44, i64 %indvars.iv40
  store double %37, double* %38, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond70, label %._crit_edge18.us, label %30

._crit_edge18.us:                                 ; preds = %30
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next45, 900
  br i1 %exitcond72, label %._crit_edge10.us.preheader, label %._crit_edge8.us

._crit_edge10.us.preheader:                       ; preds = %._crit_edge18.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge12.us, %._crit_edge10.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge12.us ], [ 0, %._crit_edge10.us.preheader ]
  br label %39

; <label>:39:                                     ; preds = %39, %._crit_edge10.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %39 ], [ 0, %._crit_edge10.us ]
  %40 = add nuw nsw i64 %indvars.iv, 2
  %41 = mul nuw nsw i64 %40, %indvars.iv35
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 1100
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 1.100000e+03
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv35, i64 %indvars.iv
  store double %45, double* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond68, label %._crit_edge12.us, label %39

._crit_edge12.us:                                 ; preds = %39
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, 800
  br i1 %exitcond, label %._crit_edge15, label %._crit_edge10.us

._crit_edge15:                                    ; preds = %._crit_edge12.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge21.us, %._crit_edge.lr.ph
  %indvars.iv64 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next65, %._crit_edge21.us ]
  br label %.lr.ph17.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge18.us.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next65, 800
  br i1 %exitcond85, label %._crit_edge6.us.preheader, label %._crit_edge.us

._crit_edge6.us.preheader:                        ; preds = %._crit_edge21.us
  br label %._crit_edge6.us

.lr.ph17.us.us:                                   ; preds = %._crit_edge18.us.us, %._crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge18.us.us ], [ 0, %._crit_edge.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv64, i64 %indvars.iv60
  store double 0.000000e+00, double* %11, align 8
  br label %.lr.ph17.us.us.new

._crit_edge18.us.us:                              ; preds = %.lr.ph17.us.us.new
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next61, 900
  br i1 %exitcond81, label %._crit_edge21.us, label %.lr.ph17.us.us

.lr.ph17.us.us.new:                               ; preds = %.lr.ph17.us.us.new, %.lr.ph17.us.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %.lr.ph17.us.us.new ], [ 0, %.lr.ph17.us.us ]
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv64, i64 %indvars.iv56
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %4
  %15 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv56, i64 %indvars.iv60
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = load double, double* %11, align 8
  %19 = fadd double %18, %17
  store double %19, double* %11, align 8
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv64, i64 %indvars.iv.next57
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  %23 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next57, i64 %indvars.iv60
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = load double, double* %11, align 8
  %27 = fadd double %26, %25
  store double %27, double* %11, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond79.1 = icmp eq i64 %indvars.iv.next57.1, 1100
  br i1 %exitcond79.1, label %._crit_edge18.us.us, label %.lr.ph17.us.us.new

._crit_edge6.us:                                  ; preds = %._crit_edge12.us, %._crit_edge6.us.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge12.us ], [ 0, %._crit_edge6.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge9.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next48, 800
  br i1 %exitcond74, label %._crit_edge14, label %._crit_edge6.us

.lr.ph.us.us:                                     ; preds = %._crit_edge9.us.us, %._crit_edge6.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge9.us.us ], [ 0, %._crit_edge6.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv47, i64 %indvars.iv43
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %5
  store double %30, double* %28, align 8
  br label %.lr.ph.us.us.new

._crit_edge9.us.us:                               ; preds = %.lr.ph.us.us.new
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond72, label %._crit_edge12.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv47, i64 %indvars.iv39
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv39, i64 %indvars.iv43
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %28, align 8
  %37 = fadd double %36, %35
  store double %37, double* %28, align 8
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %38 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv47, i64 %indvars.iv.next40
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next40, i64 %indvars.iv43
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %28, align 8
  %44 = fadd double %43, %42
  store double %44, double* %28, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next40.1, 900
  br i1 %exitcond.1, label %._crit_edge9.us.us, label %.lr.ph.us.us.new

._crit_edge14:                                    ; preds = %._crit_edge12.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv8 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next9, %._crit_edge4.us ]
  %7 = mul nsw i64 %indvars.iv8, 800
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us ], [ 0, %._crit_edge.us ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond14, label %._crit_edge4.us, label %8

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 800
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge.us

._crit_edge6:                                     ; preds = %._crit_edge4.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
