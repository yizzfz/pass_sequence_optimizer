; ModuleID = 'A.ll'
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
  tail call fastcc void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  %22 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @print_array([1100 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
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
define internal fastcc void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
.preheader60.us.preheader:
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %._crit_edge77.us, %.preheader60.us.preheader
  %indvars.iv111 = phi i64 [ 0, %.preheader60.us.preheader ], [ %indvars.iv.next112, %._crit_edge77.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader60.us
  %indvars.iv107 = phi i64 [ 0, %.preheader60.us ], [ %indvars.iv.next108, %._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv107, %indvars.iv111
  %5 = add nuw nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 800
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 4.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv111, i64 %indvars.iv107
  store double %9, double* %10, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, 1000
  br i1 %exitcond110, label %._crit_edge77.us, label %._crit_edge

._crit_edge77.us:                                 ; preds = %._crit_edge
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next112, 800
  br i1 %exitcond114, label %.preheader58.us.preheader, label %.preheader60.us

.preheader58.us.preheader:                        ; preds = %._crit_edge77.us
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %.preheader58.us.preheader, %._crit_edge72.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge72.us ], [ 0, %.preheader58.us.preheader ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader58.us
  %indvars.iv98 = phi i64 [ 0, %.preheader58.us ], [ %indvars.iv.next99, %._crit_edge1 ]
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %11 = mul nuw nsw i64 %indvars.iv.next99, %indvars.iv102
  %12 = add nuw nsw i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 900
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 4.500000e+03
  %17 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv98
  store double %16, double* %17, align 8
  %exitcond101 = icmp eq i64 %indvars.iv.next99, 900
  br i1 %exitcond101, label %._crit_edge72.us, label %._crit_edge1

._crit_edge72.us:                                 ; preds = %._crit_edge1
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 1000
  br i1 %exitcond105, label %.preheader56.us.preheader, label %.preheader58.us

.preheader56.us.preheader:                        ; preds = %._crit_edge72.us
  br label %.preheader56.us

.preheader56.us:                                  ; preds = %.preheader56.us.preheader, %._crit_edge67.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge67.us ], [ 0, %.preheader56.us.preheader ]
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.preheader56.us
  %indvars.iv89 = phi i64 [ 0, %.preheader56.us ], [ %indvars.iv.next90, %._crit_edge2 ]
  %18 = add nuw nsw i64 %indvars.iv89, 3
  %19 = mul nuw nsw i64 %18, %indvars.iv93
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 5.500000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv93, i64 %indvars.iv89
  store double %23, double* %24, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 1200
  br i1 %exitcond92, label %._crit_edge67.us, label %._crit_edge2

._crit_edge67.us:                                 ; preds = %._crit_edge2
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, 900
  br i1 %exitcond96, label %.preheader.us.preheader, label %.preheader56.us

.preheader.us.preheader:                          ; preds = %._crit_edge67.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge3 ]
  %25 = add nuw nsw i64 %indvars.iv, 2
  %26 = mul nuw nsw i64 %25, %indvars.iv84
  %27 = add nuw nsw i64 %26, 2
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.000000e+03
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv84, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge3

._crit_edge.us:                                   ; preds = %._crit_edge3
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, 1200
  br i1 %exitcond87, label %._crit_edge64, label %.preheader.us

._crit_edge64:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
.preheader71.us.preheader:
  br label %.lr.ph100.us.us.preheader

.lr.ph100.us.us.preheader:                        ; preds = %._crit_edge104.us, %.preheader71.us.preheader
  %indvars.iv174 = phi i64 [ 0, %.preheader71.us.preheader ], [ %indvars.iv.next175, %._crit_edge104.us ]
  br label %.lr.ph100.us.us.new

._crit_edge104.us:                                ; preds = %._crit_edge101.us.us
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next175, 800
  br i1 %exitcond177, label %.lr.ph86.us.us.preheader.preheader, label %.lr.ph100.us.us.preheader

.lr.ph86.us.us.preheader.preheader:               ; preds = %._crit_edge104.us
  br label %.lr.ph86.us.us.preheader

.lr.ph100.us.us.new:                              ; preds = %._crit_edge101.us.us, %.lr.ph100.us.us.preheader
  %indvars.iv168 = phi i64 [ 0, %.lr.ph100.us.us.preheader ], [ %indvars.iv.next169, %._crit_edge101.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv174, i64 %indvars.iv168
  store double 0.000000e+00, double* %7, align 8
  br label %._crit_edge

._crit_edge101.us.us:                             ; preds = %._crit_edge
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond171 = icmp eq i64 %indvars.iv.next169, 900
  br i1 %exitcond171, label %._crit_edge104.us, label %.lr.ph100.us.us.new

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph100.us.us.new
  %indvars.iv160 = phi i64 [ 0, %.lr.ph100.us.us.new ], [ %indvars.iv.next161.1, %._crit_edge ]
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv174, i64 %indvars.iv160
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv160, i64 %indvars.iv168
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = load double, double* %7, align 8
  %14 = fadd double %13, %12
  store double %14, double* %7, align 8
  %indvars.iv.next161 = or i64 %indvars.iv160, 1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv174, i64 %indvars.iv.next161
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next161, i64 %indvars.iv168
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = load double, double* %7, align 8
  %21 = fadd double %20, %19
  store double %21, double* %7, align 8
  %indvars.iv.next161.1 = add nsw i64 %indvars.iv160, 2
  %exitcond163.1 = icmp eq i64 %indvars.iv.next161.1, 1000
  br i1 %exitcond163.1, label %._crit_edge101.us.us, label %._crit_edge

.lr.ph86.us.us.preheader:                         ; preds = %.lr.ph86.us.us.preheader.preheader, %._crit_edge90.us
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge90.us ], [ 0, %.lr.ph86.us.us.preheader.preheader ]
  br label %.lr.ph86.us.us.new

._crit_edge90.us:                                 ; preds = %._crit_edge87.us.us
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next150, 900
  br i1 %exitcond152, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph86.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge90.us
  br label %.lr.ph.us.us.preheader

.lr.ph86.us.us.new:                               ; preds = %._crit_edge87.us.us, %.lr.ph86.us.us.preheader
  %indvars.iv143 = phi i64 [ 0, %.lr.ph86.us.us.preheader ], [ %indvars.iv.next144, %._crit_edge87.us.us ]
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv149, i64 %indvars.iv143
  store double 0.000000e+00, double* %22, align 8
  br label %._crit_edge1

._crit_edge87.us.us:                              ; preds = %._crit_edge1
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next144, 1100
  br i1 %exitcond146, label %._crit_edge90.us, label %.lr.ph86.us.us.new

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph86.us.us.new
  %indvars.iv135 = phi i64 [ 0, %.lr.ph86.us.us.new ], [ %indvars.iv.next136.1, %._crit_edge1 ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv135
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv135, i64 %indvars.iv143
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = load double, double* %22, align 8
  %29 = fadd double %28, %27
  store double %29, double* %22, align 8
  %indvars.iv.next136 = or i64 %indvars.iv135, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv.next136
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next136, i64 %indvars.iv143
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = load double, double* %22, align 8
  %36 = fadd double %35, %34
  store double %36, double* %22, align 8
  %indvars.iv.next136.1 = add nsw i64 %indvars.iv135, 2
  %exitcond138.1 = icmp eq i64 %indvars.iv.next136.1, 1200
  br i1 %exitcond138.1, label %._crit_edge87.us.us, label %._crit_edge1

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge75.us
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge75.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us.new

._crit_edge75.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next125, 800
  br i1 %exitcond127, label %._crit_edge77, label %.lr.ph.us.us.preheader

.lr.ph.us.us.new:                                 ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv119 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next120, %._crit_edge.us.us ]
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv124, i64 %indvars.iv119
  store double 0.000000e+00, double* %37, align 8
  br label %._crit_edge2

._crit_edge.us.us:                                ; preds = %._crit_edge2
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond = icmp eq i64 %indvars.iv.next120, 1100
  br i1 %exitcond, label %._crit_edge75.us, label %.lr.ph.us.us.new

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us.new ], [ %indvars.iv.next.1, %._crit_edge2 ]
  %38 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv124, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %indvars.iv119
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %37, align 8
  %44 = fadd double %43, %42
  store double %44, double* %37, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %45 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv124, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv119
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %37, align 8
  %51 = fadd double %50, %49
  store double %51, double* %37, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge2

._crit_edge77:                                    ; preds = %._crit_edge75.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv16, 800
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge1
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge1

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 800
  br i1 %exitcond19, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
