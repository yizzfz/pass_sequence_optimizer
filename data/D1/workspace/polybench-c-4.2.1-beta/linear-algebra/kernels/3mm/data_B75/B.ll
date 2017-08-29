; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
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
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %18
  br label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
.lr.ph51:
  br label %.lr.ph51.split.us

.lr.ph51.split.us:                                ; preds = %._crit_edge46.us..lr.ph51.split.us_crit_edge, %.lr.ph51
  %indvars.iv88 = phi i64 [ 0, %.lr.ph51 ], [ %indvars.iv.next89, %._crit_edge46.us..lr.ph51.split.us_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph51.split.us
  %indvars.iv84 = phi i64 [ 0, %.lr.ph51.split.us ], [ %indvars.iv.next85, %._crit_edge.._crit_edge_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv84, %indvars.iv88
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 800
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 4.000000e+03
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv88, i64 %indvars.iv84
  store double %14, double* %15, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, 1000
  br i1 %exitcond87, label %._crit_edge46.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge46.us:                                 ; preds = %._crit_edge
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, 800
  br i1 %exitcond91, label %.lr.ph38.split.us.preheader, label %._crit_edge46.us..lr.ph51.split.us_crit_edge

._crit_edge46.us..lr.ph51.split.us_crit_edge:     ; preds = %._crit_edge46.us
  br label %.lr.ph51.split.us

.lr.ph38.split.us.preheader:                      ; preds = %._crit_edge46.us
  br label %.lr.ph38.split.us

.lr.ph38.split.us:                                ; preds = %._crit_edge33.us..lr.ph38.split.us_crit_edge, %.lr.ph38.split.us.preheader
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge33.us..lr.ph38.split.us_crit_edge ], [ 0, %.lr.ph38.split.us.preheader ]
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.._crit_edge93_crit_edge, %.lr.ph38.split.us
  %indvars.iv75 = phi i64 [ 0, %.lr.ph38.split.us ], [ %indvars.iv.next76, %._crit_edge93.._crit_edge93_crit_edge ]
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %16 = mul nuw nsw i64 %indvars.iv.next76, %indvars.iv79
  %17 = add nuw nsw i64 %16, 2
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 900
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 4.500000e+03
  %22 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv79, i64 %indvars.iv75
  store double %21, double* %22, align 8
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 900
  br i1 %exitcond78, label %._crit_edge33.us, label %._crit_edge93.._crit_edge93_crit_edge

._crit_edge93.._crit_edge93_crit_edge:            ; preds = %._crit_edge93
  br label %._crit_edge93

._crit_edge33.us:                                 ; preds = %._crit_edge93
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 1000
  br i1 %exitcond82, label %.lr.ph25.split.us.preheader, label %._crit_edge33.us..lr.ph38.split.us_crit_edge

._crit_edge33.us..lr.ph38.split.us_crit_edge:     ; preds = %._crit_edge33.us
  br label %.lr.ph38.split.us

.lr.ph25.split.us.preheader:                      ; preds = %._crit_edge33.us
  br label %.lr.ph25.split.us

.lr.ph25.split.us:                                ; preds = %._crit_edge20.us..lr.ph25.split.us_crit_edge, %.lr.ph25.split.us.preheader
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge20.us..lr.ph25.split.us_crit_edge ], [ 0, %.lr.ph25.split.us.preheader ]
  br label %._crit_edge94

._crit_edge94:                                    ; preds = %._crit_edge94.._crit_edge94_crit_edge, %.lr.ph25.split.us
  %indvars.iv66 = phi i64 [ 0, %.lr.ph25.split.us ], [ %indvars.iv.next67, %._crit_edge94.._crit_edge94_crit_edge ]
  %23 = add nuw nsw i64 %indvars.iv66, 3
  %24 = mul nuw nsw i64 %23, %indvars.iv70
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 1100
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 5.500000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv66
  store double %28, double* %29, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 1200
  br i1 %exitcond69, label %._crit_edge20.us, label %._crit_edge94.._crit_edge94_crit_edge

._crit_edge94.._crit_edge94_crit_edge:            ; preds = %._crit_edge94
  br label %._crit_edge94

._crit_edge20.us:                                 ; preds = %._crit_edge94
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 900
  br i1 %exitcond73, label %.lr.ph13.split.us.preheader, label %._crit_edge20.us..lr.ph25.split.us_crit_edge

._crit_edge20.us..lr.ph25.split.us_crit_edge:     ; preds = %._crit_edge20.us
  br label %.lr.ph25.split.us

.lr.ph13.split.us.preheader:                      ; preds = %._crit_edge20.us
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %._crit_edge.us..lr.ph13.split.us_crit_edge, %.lr.ph13.split.us.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us..lr.ph13.split.us_crit_edge ], [ 0, %.lr.ph13.split.us.preheader ]
  br label %._crit_edge95

._crit_edge95:                                    ; preds = %._crit_edge95.._crit_edge95_crit_edge, %.lr.ph13.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph13.split.us ], [ %indvars.iv.next, %._crit_edge95.._crit_edge95_crit_edge ]
  %30 = add nuw nsw i64 %indvars.iv, 2
  %31 = mul nuw nsw i64 %30, %indvars.iv61
  %32 = add nuw nsw i64 %31, 2
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1000
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 5.000000e+03
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv61, i64 %indvars.iv
  store double %36, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge95.._crit_edge95_crit_edge

._crit_edge95.._crit_edge95_crit_edge:            ; preds = %._crit_edge95
  br label %._crit_edge95

._crit_edge.us:                                   ; preds = %._crit_edge95
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond64, label %._crit_edge14, label %._crit_edge.us..lr.ph13.split.us_crit_edge

._crit_edge.us..lr.ph13.split.us_crit_edge:       ; preds = %._crit_edge.us
  br label %.lr.ph13.split.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) #2 {
.lr.ph72:
  br label %.lr.ph72.split.us

.lr.ph72.split.us:                                ; preds = %._crit_edge67.us..lr.ph72.split.us_crit_edge, %.lr.ph72
  %indvars.iv155 = phi i64 [ 0, %.lr.ph72 ], [ %indvars.iv.next156, %._crit_edge67.us..lr.ph72.split.us_crit_edge ]
  br label %.lr.ph62.us.us

._crit_edge67.us:                                 ; preds = %._crit_edge63.us.us
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next156, 800
  br i1 %exitcond158, label %.lr.ph44.split.us.preheader, label %._crit_edge67.us..lr.ph72.split.us_crit_edge

._crit_edge67.us..lr.ph72.split.us_crit_edge:     ; preds = %._crit_edge67.us
  br label %.lr.ph72.split.us

.lr.ph44.split.us.preheader:                      ; preds = %._crit_edge67.us
  br label %.lr.ph44.split.us

.lr.ph62.us.us:                                   ; preds = %._crit_edge63.us.us..lr.ph62.us.us_crit_edge, %.lr.ph72.split.us
  %indvars.iv149 = phi i64 [ 0, %.lr.ph72.split.us ], [ %indvars.iv.next150, %._crit_edge63.us.us..lr.ph62.us.us_crit_edge ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv155, i64 %indvars.iv149
  store double 0.000000e+00, double* %12, align 8
  br label %.lr.ph62.us.us.new

._crit_edge63.us.us:                              ; preds = %.lr.ph62.us.us.new
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next150, 900
  br i1 %exitcond152, label %._crit_edge67.us, label %._crit_edge63.us.us..lr.ph62.us.us_crit_edge

._crit_edge63.us.us..lr.ph62.us.us_crit_edge:     ; preds = %._crit_edge63.us.us
  br label %.lr.ph62.us.us

.lr.ph62.us.us.new:                               ; preds = %.lr.ph62.us.us.new..lr.ph62.us.us.new_crit_edge, %.lr.ph62.us.us
  %indvars.iv140 = phi i64 [ 0, %.lr.ph62.us.us ], [ %indvars.iv.next141.1, %.lr.ph62.us.us.new..lr.ph62.us.us.new_crit_edge ]
  %13 = phi double [ 0.000000e+00, %.lr.ph62.us.us ], [ %25, %.lr.ph62.us.us.new..lr.ph62.us.us.new_crit_edge ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv155, i64 %indvars.iv140
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv140, i64 %indvars.iv149
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %18, %13
  store double %19, double* %12, align 8
  %indvars.iv.next141 = or i64 %indvars.iv140, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv155, i64 %indvars.iv.next141
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next141, i64 %indvars.iv149
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %24, %19
  store double %25, double* %12, align 8
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %exitcond143.1 = icmp eq i64 %indvars.iv.next141.1, 1000
  br i1 %exitcond143.1, label %._crit_edge63.us.us, label %.lr.ph62.us.us.new..lr.ph62.us.us.new_crit_edge

.lr.ph62.us.us.new..lr.ph62.us.us.new_crit_edge:  ; preds = %.lr.ph62.us.us.new
  br label %.lr.ph62.us.us.new

.lr.ph44.split.us:                                ; preds = %._crit_edge39.us..lr.ph44.split.us_crit_edge, %.lr.ph44.split.us.preheader
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge39.us..lr.ph44.split.us_crit_edge ], [ 0, %.lr.ph44.split.us.preheader ]
  br label %.lr.ph34.us.us

._crit_edge39.us:                                 ; preds = %._crit_edge35.us.us
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 900
  br i1 %exitcond132, label %.lr.ph16.split.us.preheader, label %._crit_edge39.us..lr.ph44.split.us_crit_edge

._crit_edge39.us..lr.ph44.split.us_crit_edge:     ; preds = %._crit_edge39.us
  br label %.lr.ph44.split.us

.lr.ph16.split.us.preheader:                      ; preds = %._crit_edge39.us
  br label %.lr.ph16.split.us

.lr.ph34.us.us:                                   ; preds = %._crit_edge35.us.us..lr.ph34.us.us_crit_edge, %.lr.ph44.split.us
  %indvars.iv123 = phi i64 [ 0, %.lr.ph44.split.us ], [ %indvars.iv.next124, %._crit_edge35.us.us..lr.ph34.us.us_crit_edge ]
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv129, i64 %indvars.iv123
  store double 0.000000e+00, double* %26, align 8
  br label %.lr.ph34.us.us.new

._crit_edge35.us.us:                              ; preds = %.lr.ph34.us.us.new
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next124, 1100
  br i1 %exitcond126, label %._crit_edge39.us, label %._crit_edge35.us.us..lr.ph34.us.us_crit_edge

._crit_edge35.us.us..lr.ph34.us.us_crit_edge:     ; preds = %._crit_edge35.us.us
  br label %.lr.ph34.us.us

.lr.ph34.us.us.new:                               ; preds = %.lr.ph34.us.us.new..lr.ph34.us.us.new_crit_edge, %.lr.ph34.us.us
  %indvars.iv114 = phi i64 [ 0, %.lr.ph34.us.us ], [ %indvars.iv.next115.1, %.lr.ph34.us.us.new..lr.ph34.us.us.new_crit_edge ]
  %27 = phi double [ 0.000000e+00, %.lr.ph34.us.us ], [ %39, %.lr.ph34.us.us.new..lr.ph34.us.us.new_crit_edge ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv129, i64 %indvars.iv114
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv114, i64 %indvars.iv123
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %32, %27
  store double %33, double* %26, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv129, i64 %indvars.iv.next115
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next115, i64 %indvars.iv123
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %38, %33
  store double %39, double* %26, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %exitcond117.1 = icmp eq i64 %indvars.iv.next115.1, 1200
  br i1 %exitcond117.1, label %._crit_edge35.us.us, label %.lr.ph34.us.us.new..lr.ph34.us.us.new_crit_edge

.lr.ph34.us.us.new..lr.ph34.us.us.new_crit_edge:  ; preds = %.lr.ph34.us.us.new
  br label %.lr.ph34.us.us.new

.lr.ph16.split.us:                                ; preds = %._crit_edge11.us..lr.ph16.split.us_crit_edge, %.lr.ph16.split.us.preheader
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge11.us..lr.ph16.split.us_crit_edge ], [ 0, %.lr.ph16.split.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge11.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 800
  br i1 %exitcond106, label %._crit_edge17, label %._crit_edge11.us..lr.ph16.split.us_crit_edge

._crit_edge11.us..lr.ph16.split.us_crit_edge:     ; preds = %._crit_edge11.us
  br label %.lr.ph16.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph16.split.us
  %indvars.iv98 = phi i64 [ 0, %.lr.ph16.split.us ], [ %indvars.iv.next99, %._crit_edge.us.us..lr.ph.us.us_crit_edge ]
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv103, i64 %indvars.iv98
  store double 0.000000e+00, double* %40, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond = icmp eq i64 %indvars.iv.next99, 1100
  br i1 %exitcond, label %._crit_edge11.us, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ]
  %41 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %53, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ]
  %42 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv98
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %46, %41
  store double %47, double* %40, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %48 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv98
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %52, %47
  store double %53, double* %40, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

._crit_edge17:                                    ; preds = %._crit_edge11.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]* nocapture readonly) #0 {
.lr.ph4.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us..lr.ph4.split.us_crit_edge, %.lr.ph4.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us..lr.ph4.split.us_crit_edge ]
  %7 = mul nsw i64 %indvars.iv10, 800
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge.._crit_edge15_crit_edge, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge15_crit_edge ]
  %8 = add nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge15.._crit_edge_crit_edge

._crit_edge15.._crit_edge_crit_edge:              ; preds = %._crit_edge15
  br label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge15
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge15.._crit_edge_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge15_crit_edge

._crit_edge.._crit_edge15_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond13, label %._crit_edge5, label %._crit_edge.us..lr.ph4.split.us_crit_edge

._crit_edge.us..lr.ph4.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph4.split.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
