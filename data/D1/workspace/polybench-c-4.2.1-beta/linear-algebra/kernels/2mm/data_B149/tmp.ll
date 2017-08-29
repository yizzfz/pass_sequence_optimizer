; ModuleID = 'A.ll'
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.lr.ph26:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %._crit_edge23.us, %.lr.ph26
  %indvars.iv83 = phi i64 [ 0, %.lr.ph26 ], [ %indvars.iv.next84, %._crit_edge23.us ]
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98, %.lr.ph26.split.us
  %indvars.iv79 = phi i64 [ 0, %.lr.ph26.split.us ], [ %indvars.iv.next80, %._crit_edge98 ]
  %10 = mul nuw nsw i64 %indvars.iv83, %indvars.iv79
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 8.000000e+02
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv83, i64 %indvars.iv79
  store double %15, double* %16, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 1100
  br i1 %exitcond82, label %._crit_edge23.us, label %._crit_edge98

._crit_edge23.us:                                 ; preds = %._crit_edge98
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next84, 800
  br i1 %exitcond94, label %.lr.ph19.split.us.preheader, label %.lr.ph26.split.us

.lr.ph19.split.us.preheader:                      ; preds = %._crit_edge23.us
  br label %.lr.ph19.split.us

.lr.ph19.split.us:                                ; preds = %.lr.ph19.split.us.preheader, %._crit_edge16.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge16.us ], [ 0, %.lr.ph19.split.us.preheader ]
  br label %.lr.ph19.split.us.new

.lr.ph19.split.us.new:                            ; preds = %.lr.ph19.split.us.new, %.lr.ph19.split.us
  %indvars.iv71 = phi i64 [ 0, %.lr.ph19.split.us ], [ %indvars.iv.next72.1, %.lr.ph19.split.us.new ]
  %indvars.iv.next72 = or i64 %indvars.iv71, 1
  %17 = mul nuw nsw i64 %indvars.iv75, %indvars.iv.next72
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 900
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 9.000000e+02
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv75, i64 %indvars.iv71
  store double %21, double* %22, align 8
  %indvars.iv.next72.1 = add nuw nsw i64 %indvars.iv71, 2
  %23 = mul nuw nsw i64 %indvars.iv75, %indvars.iv.next72.1
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 900
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 9.000000e+02
  %28 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv75, i64 %indvars.iv.next72
  store double %27, double* %28, align 8
  %exitcond74.1 = icmp eq i64 %indvars.iv.next72.1, 900
  br i1 %exitcond74.1, label %._crit_edge16.us, label %.lr.ph19.split.us.new

._crit_edge16.us:                                 ; preds = %.lr.ph19.split.us.new
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next76, 1100
  br i1 %exitcond93, label %.lr.ph12.split.us.preheader, label %.lr.ph19.split.us

.lr.ph12.split.us.preheader:                      ; preds = %._crit_edge16.us
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %.lr.ph12.split.us.preheader, %._crit_edge9.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge9.us ], [ 0, %.lr.ph12.split.us.preheader ]
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99, %.lr.ph12.split.us
  %indvars.iv63 = phi i64 [ 0, %.lr.ph12.split.us ], [ %indvars.iv.next64, %._crit_edge99 ]
  %29 = add nuw nsw i64 %indvars.iv63, 3
  %30 = mul nuw nsw i64 %indvars.iv67, %29
  %31 = add nuw nsw i64 %30, 1
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1200
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.200000e+03
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv67, i64 %indvars.iv63
  store double %35, double* %36, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond66, label %._crit_edge9.us, label %._crit_edge99

._crit_edge9.us:                                  ; preds = %._crit_edge99
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next68, 900
  br i1 %exitcond92, label %.lr.ph5.split.us.preheader, label %.lr.ph12.split.us

.lr.ph5.split.us.preheader:                       ; preds = %._crit_edge9.us
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge100 ]
  %37 = add nuw nsw i64 %indvars.iv, 2
  %38 = mul nuw nsw i64 %indvars.iv61, %37
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 1100
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, 1.100000e+03
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv61, i64 %indvars.iv
  store double %42, double* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge100

._crit_edge.us:                                   ; preds = %._crit_edge100
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next62, 800
  br i1 %exitcond91, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.lr.ph14:
  br label %.lr.ph11.us

.lr.ph11.us:                                      ; preds = %._crit_edge12.us, %.lr.ph14
  %indvar = phi i64 [ 0, %.lr.ph14 ], [ %indvar.next, %._crit_edge12.us ]
  br label %.lr.ph8.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge9.us.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond97 = icmp eq i64 %indvar.next, 800
  br i1 %exitcond97, label %.lr.ph2.us.preheader, label %.lr.ph11.us

.lr.ph2.us.preheader:                             ; preds = %._crit_edge12.us
  br label %.lr.ph2.us

.lr.ph8.us.us:                                    ; preds = %._crit_edge9.us.us, %.lr.ph11.us
  %indvars.iv77 = phi i64 [ 0, %.lr.ph11.us ], [ %indvars.iv.next78, %._crit_edge9.us.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvar, i64 %indvars.iv77
  store double 0.000000e+00, double* %11, align 8
  br label %._crit_edge

._crit_edge9.us.us:                               ; preds = %._crit_edge
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 900
  br i1 %exitcond80, label %._crit_edge12.us, label %.lr.ph8.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph8.us.us
  %12 = phi double [ 0.000000e+00, %.lr.ph8.us.us ], [ %26, %._crit_edge ]
  %indvars.iv74 = phi i64 [ 0, %.lr.ph8.us.us ], [ %indvars.iv.next75.1, %._crit_edge ]
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvar, i64 %indvars.iv74
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  %16 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv74, i64 %indvars.iv77
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %12, %18
  store double %19, double* %11, align 8
  %indvars.iv.next75 = or i64 %indvars.iv74, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvar, i64 %indvars.iv.next75
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  %23 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next75, i64 %indvars.iv77
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %19, %25
  store double %26, double* %11, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next75.1, 1100
  br i1 %exitcond93.1, label %._crit_edge9.us.us, label %._crit_edge

.lr.ph2.us:                                       ; preds = %.lr.ph2.us.preheader, %._crit_edge3.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge3.us ], [ 0, %.lr.ph2.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next69, 800
  br i1 %exitcond96, label %._crit_edge6, label %.lr.ph2.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph2.us
  %indvars.iv64 = phi i64 [ 0, %.lr.ph2.us ], [ %indvars.iv.next65, %._crit_edge.us.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv68, i64 %indvars.iv64
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %5
  store double %29, double* %27, align 8
  br label %._crit_edge127

._crit_edge.us.us:                                ; preds = %._crit_edge127
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1200
  br i1 %exitcond67, label %._crit_edge3.us, label %.lr.ph.us.us

._crit_edge127:                                   ; preds = %._crit_edge127, %.lr.ph.us.us
  %30 = phi double [ %29, %.lr.ph.us.us ], [ %48, %._crit_edge127 ]
  %indvars.iv62 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next63.2, %._crit_edge127 ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv62
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv62, i64 %indvars.iv64
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %27, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv.next63
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next63, i64 %indvars.iv64
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %27, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %43 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv.next63.1
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next63.1, i64 %indvars.iv64
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %27, align 8
  %indvars.iv.next63.2 = add nsw i64 %indvars.iv62, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next63.2, 900
  br i1 %exitcond.2, label %._crit_edge.us.us, label %._crit_edge127

._crit_edge6:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
.lr.ph4:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge2.us, %.lr.ph4
  %indvars.iv12 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next13, %._crit_edge2.us ]
  %7 = mul nuw nsw i64 %indvars.iv12, 800
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %._crit_edge.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 800
  br i1 %exitcond15, label %._crit_edge5, label %.lr.ph4.split.us

._crit_edge5:                                     ; preds = %._crit_edge2.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
