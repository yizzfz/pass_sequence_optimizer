; ModuleID = 'B.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %18, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge28.us, %._crit_edge.lr.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge28.us ], [ 0, %._crit_edge.lr.ph ]
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %9 ], [ 0, %._crit_edge.us ]
  %10 = mul nuw nsw i64 %indvars.iv58, %indvars.iv62
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 4.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv58
  store double %15, double* %16, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond78, label %._crit_edge28.us, label %9

._crit_edge28.us:                                 ; preds = %9
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next63, 800
  br i1 %exitcond80, label %._crit_edge6.us.preheader, label %._crit_edge.us

._crit_edge6.us.preheader:                        ; preds = %._crit_edge28.us
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge23.us, %._crit_edge6.us.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge23.us ], [ 0, %._crit_edge6.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %._crit_edge6.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %17 ], [ 0, %._crit_edge6.us ]
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %18 = mul nuw nsw i64 %indvars.iv.next50, %indvars.iv53
  %19 = add nuw nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 4.500000e+03
  %24 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv53, i64 %indvars.iv49
  store double %23, double* %24, align 8
  %exitcond74 = icmp eq i64 %indvars.iv.next50, 900
  br i1 %exitcond74, label %._crit_edge23.us, label %17

._crit_edge23.us:                                 ; preds = %17
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next54, 1000
  br i1 %exitcond76, label %._crit_edge8.us.preheader, label %._crit_edge6.us

._crit_edge8.us.preheader:                        ; preds = %._crit_edge23.us
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge18.us, %._crit_edge8.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge18.us ], [ 0, %._crit_edge8.us.preheader ]
  br label %25

; <label>:25:                                     ; preds = %25, %._crit_edge8.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %25 ], [ 0, %._crit_edge8.us ]
  %26 = add nuw nsw i64 %indvars.iv40, 3
  %27 = mul nuw nsw i64 %26, %indvars.iv44
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.500000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv44, i64 %indvars.iv40
  store double %31, double* %32, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond70, label %._crit_edge18.us, label %25

._crit_edge18.us:                                 ; preds = %25
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next45, 900
  br i1 %exitcond72, label %._crit_edge10.us.preheader, label %._crit_edge8.us

._crit_edge10.us.preheader:                       ; preds = %._crit_edge18.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge12.us, %._crit_edge10.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge12.us ], [ 0, %._crit_edge10.us.preheader ]
  br label %33

; <label>:33:                                     ; preds = %33, %._crit_edge10.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %33 ], [ 0, %._crit_edge10.us ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %34, %indvars.iv35
  %36 = add nuw nsw i64 %35, 2
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 1000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 5.000000e+03
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv35, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond68, label %._crit_edge12.us, label %33

._crit_edge12.us:                                 ; preds = %33
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond, label %._crit_edge15, label %._crit_edge10.us

._crit_edge15:                                    ; preds = %._crit_edge12.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge33.us, %._crit_edge.lr.ph
  %indvars.iv101 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next102, %._crit_edge33.us ]
  br label %.lr.ph29.us.us

._crit_edge33.us:                                 ; preds = %._crit_edge30.us.us
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next102, 800
  br i1 %exitcond138, label %._crit_edge8.us.preheader, label %._crit_edge.us

._crit_edge8.us.preheader:                        ; preds = %._crit_edge33.us
  br label %._crit_edge8.us

.lr.ph29.us.us:                                   ; preds = %._crit_edge30.us.us, %._crit_edge.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge30.us.us ], [ 0, %._crit_edge.us ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv101, i64 %indvars.iv97
  store double 0.000000e+00, double* %12, align 8
  br label %.lr.ph29.us.us.new

._crit_edge30.us.us:                              ; preds = %.lr.ph29.us.us.new
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next98, 900
  br i1 %exitcond134, label %._crit_edge33.us, label %.lr.ph29.us.us

.lr.ph29.us.us.new:                               ; preds = %.lr.ph29.us.us.new, %.lr.ph29.us.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94.1, %.lr.ph29.us.us.new ], [ 0, %.lr.ph29.us.us ]
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv101, i64 %indvars.iv93
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv93, i64 %indvars.iv97
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = load double, double* %12, align 8
  %19 = fadd double %18, %17
  store double %19, double* %12, align 8
  %indvars.iv.next94 = or i64 %indvars.iv93, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv101, i64 %indvars.iv.next94
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next94, i64 %indvars.iv97
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = load double, double* %12, align 8
  %26 = fadd double %25, %24
  store double %26, double* %12, align 8
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93, 2
  %exitcond132.1 = icmp eq i64 %indvars.iv.next94.1, 1000
  br i1 %exitcond132.1, label %._crit_edge30.us.us, label %.lr.ph29.us.us.new

._crit_edge8.us:                                  ; preds = %._crit_edge25.us, %._crit_edge8.us.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge25.us ], [ 0, %._crit_edge8.us.preheader ]
  br label %.lr.ph21.us.us

._crit_edge25.us:                                 ; preds = %._crit_edge22.us.us
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next85, 900
  br i1 %exitcond126, label %._crit_edge10.us.preheader, label %._crit_edge8.us

._crit_edge10.us.preheader:                       ; preds = %._crit_edge25.us
  br label %._crit_edge10.us

.lr.ph21.us.us:                                   ; preds = %._crit_edge22.us.us, %._crit_edge8.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge22.us.us ], [ 0, %._crit_edge8.us ]
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv84, i64 %indvars.iv80
  store double 0.000000e+00, double* %27, align 8
  br label %.lr.ph21.us.us.new

._crit_edge22.us.us:                              ; preds = %.lr.ph21.us.us.new
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next81, 1100
  br i1 %exitcond122, label %._crit_edge25.us, label %.lr.ph21.us.us

.lr.ph21.us.us.new:                               ; preds = %.lr.ph21.us.us.new, %.lr.ph21.us.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.1, %.lr.ph21.us.us.new ], [ 0, %.lr.ph21.us.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv84, i64 %indvars.iv76
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv76, i64 %indvars.iv80
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = load double, double* %27, align 8
  %34 = fadd double %33, %32
  store double %34, double* %27, align 8
  %indvars.iv.next77 = or i64 %indvars.iv76, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv84, i64 %indvars.iv.next77
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next77, i64 %indvars.iv80
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %27, align 8
  %41 = fadd double %40, %39
  store double %41, double* %27, align 8
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  %exitcond120.1 = icmp eq i64 %indvars.iv.next77.1, 1200
  br i1 %exitcond120.1, label %._crit_edge22.us.us, label %.lr.ph21.us.us.new

._crit_edge10.us:                                 ; preds = %._crit_edge16.us, %._crit_edge10.us.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge16.us ], [ 0, %._crit_edge10.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge16.us:                                 ; preds = %._crit_edge13.us.us
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next68, 800
  br i1 %exitcond114, label %._crit_edge18, label %._crit_edge10.us

.lr.ph.us.us:                                     ; preds = %._crit_edge13.us.us, %._crit_edge10.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge13.us.us ], [ 0, %._crit_edge10.us ]
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv67, i64 %indvars.iv63
  store double 0.000000e+00, double* %42, align 8
  br label %.lr.ph.us.us.new

._crit_edge13.us.us:                              ; preds = %.lr.ph.us.us.new
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next64, 1100
  br i1 %exitcond110, label %._crit_edge16.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %43 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv59
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv59, i64 %indvars.iv63
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %42, align 8
  %49 = fadd double %48, %47
  store double %49, double* %42, align 8
  %indvars.iv.next60 = or i64 %indvars.iv59, 1
  %50 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv.next60
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next60, i64 %indvars.iv63
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %42, align 8
  %56 = fadd double %55, %54
  store double %56, double* %42, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next60.1, 900
  br i1 %exitcond.1, label %._crit_edge13.us.us, label %.lr.ph.us.us.new

._crit_edge18:                                    ; preds = %._crit_edge16.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
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
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, 1100
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
