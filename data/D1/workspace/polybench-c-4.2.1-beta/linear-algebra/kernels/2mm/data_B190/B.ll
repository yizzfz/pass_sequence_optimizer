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
.lr.ph20.split.us.preheader:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge18.us, %.lr.ph20.split.us.preheader
  %indvars.iv74 = phi i64 [ 0, %.lr.ph20.split.us.preheader ], [ %indvars.iv.next75, %._crit_edge18.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph20.split.us
  %indvars.iv70 = phi i64 [ 0, %.lr.ph20.split.us ], [ %indvars.iv.next71, %._crit_edge ]
  %10 = mul nuw nsw i64 %indvars.iv70, %indvars.iv74
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 8.000000e+02
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv70
  store double %15, double* %16, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 1100
  br i1 %exitcond73, label %._crit_edge18.us, label %._crit_edge

._crit_edge18.us:                                 ; preds = %._crit_edge
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next75, 800
  br i1 %exitcond103, label %.lr.ph14.split.us.new.preheader.preheader, label %.lr.ph20.split.us

.lr.ph14.split.us.new.preheader.preheader:        ; preds = %._crit_edge18.us
  br label %.lr.ph14.split.us.new.preheader

.lr.ph14.split.us.new.preheader:                  ; preds = %._crit_edge12.us, %.lr.ph14.split.us.new.preheader.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge12.us ], [ 0, %.lr.ph14.split.us.new.preheader.preheader ]
  br label %.lr.ph14.split.us.new

.lr.ph14.split.us.new:                            ; preds = %.lr.ph14.split.us.new, %.lr.ph14.split.us.new.preheader
  %indvars.iv62 = phi i64 [ 0, %.lr.ph14.split.us.new.preheader ], [ %indvars.iv.next63.1, %.lr.ph14.split.us.new ]
  %indvars.iv.next63 = or i64 %indvars.iv62, 1
  %17 = mul nuw nsw i64 %indvars.iv.next63, %indvars.iv66
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 900
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv66, i64 %indvars.iv62
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %22 = mul nuw nsw i64 %indvars.iv.next63.1, %indvars.iv66
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 900
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fdiv <2 x double> %27, <double 9.000000e+02, double 9.000000e+02>
  %29 = bitcast double* %21 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63.1, 900
  br i1 %exitcond65.1, label %._crit_edge12.us, label %.lr.ph14.split.us.new

._crit_edge12.us:                                 ; preds = %.lr.ph14.split.us.new
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next67, 1100
  br i1 %exitcond102, label %.lr.ph8.split.us.preheader, label %.lr.ph14.split.us.new.preheader

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge12.us
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge6.us ], [ 0, %.lr.ph8.split.us.preheader ]
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98, %.lr.ph8.split.us
  %indvars.iv54 = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next55, %._crit_edge98 ]
  %30 = add nuw nsw i64 %indvars.iv54, 3
  %31 = mul nuw nsw i64 %30, %indvars.iv58
  %32 = add nuw nsw i64 %31, 1
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1200
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.200000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv58, i64 %indvars.iv54
  store double %36, double* %37, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond57, label %._crit_edge6.us, label %._crit_edge98

._crit_edge6.us:                                  ; preds = %._crit_edge98
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next59, 900
  br i1 %exitcond101, label %.lr.ph2.split.us.preheader, label %.lr.ph8.split.us

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge6.us
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge99 ]
  %38 = add nuw nsw i64 %indvars.iv, 2
  %39 = mul nuw nsw i64 %38, %indvars.iv52
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 1100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.100000e+03
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv52, i64 %indvars.iv
  store double %43, double* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge99

._crit_edge.us:                                   ; preds = %._crit_edge99
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next53, 800
  br i1 %exitcond100, label %45, label %.lr.ph2.split.us

; <label>:45:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.lr.ph14.split.us:
  br label %.lr.ph8.us.us.preheader

.lr.ph8.us.us.preheader:                          ; preds = %._crit_edge12.us, %.lr.ph14.split.us
  %indvars.iv81 = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvars.iv.next82, %._crit_edge12.us ]
  br label %.lr.ph8.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge9.us.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next82, 800
  br i1 %exitcond105, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph8.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge12.us
  br label %.lr.ph.us.us.preheader

.lr.ph8.us.us:                                    ; preds = %._crit_edge9.us.us, %.lr.ph8.us.us.preheader
  %indvars.iv77 = phi i64 [ 0, %.lr.ph8.us.us.preheader ], [ %indvars.iv.next78, %._crit_edge9.us.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv81, i64 %indvars.iv77
  store double 0.000000e+00, double* %11, align 8
  br label %._crit_edge

._crit_edge9.us.us:                               ; preds = %._crit_edge
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 900
  br i1 %exitcond80, label %._crit_edge12.us, label %.lr.ph8.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph8.us.us
  %12 = phi double [ 0.000000e+00, %.lr.ph8.us.us ], [ %26, %._crit_edge ]
  %indvars.iv74 = phi i64 [ 0, %.lr.ph8.us.us ], [ %indvars.iv.next75.1, %._crit_edge ]
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv81, i64 %indvars.iv74
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  %16 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv74, i64 %indvars.iv77
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %18, %12
  store double %19, double* %11, align 8
  %indvars.iv.next75 = or i64 %indvars.iv74, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv81, i64 %indvars.iv.next75
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  %23 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next75, i64 %indvars.iv77
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %25, %19
  store double %26, double* %11, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next75.1, 1100
  br i1 %exitcond93.1, label %._crit_edge9.us.us, label %._crit_edge

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge3.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge3.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next69, 800
  br i1 %exitcond104, label %49, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next65, %._crit_edge.us.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv68, i64 %indvars.iv64
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %5
  store double %29, double* %27, align 8
  br label %._crit_edge103

._crit_edge.us.us:                                ; preds = %._crit_edge103
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1200
  br i1 %exitcond67, label %._crit_edge3.us, label %.lr.ph.us.us

._crit_edge103:                                   ; preds = %._crit_edge103, %.lr.ph.us.us
  %30 = phi double [ %29, %.lr.ph.us.us ], [ %48, %._crit_edge103 ]
  %indvars.iv62 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next63.2, %._crit_edge103 ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv62
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv62, i64 %indvars.iv64
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %35, %30
  store double %36, double* %27, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv.next63
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next63, i64 %indvars.iv64
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %41, %36
  store double %42, double* %27, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %43 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv.next63.1
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next63.1, i64 %indvars.iv64
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %47, %42
  store double %48, double* %27, align 8
  %indvars.iv.next63.2 = add nsw i64 %indvars.iv62, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next63.2, 900
  br i1 %exitcond.2, label %._crit_edge.us.us, label %._crit_edge103

; <label>:49:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
.lr.ph2.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv10, 800
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge18
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond19, label %18, label %.lr.ph2.split.us

; <label>:18:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
