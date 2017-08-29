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
  tail call fastcc void @init_array([1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_bicg([1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %11, double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1900 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph10.new.preheader:
  br label %.lr.ph10.new

.lr.ph4.split.us.new.preheader:                   ; preds = %._crit_edge.us..lr.ph4.split.us.new.preheader_crit_edge, %.lr.ph4.split.us.new.preheader.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us..lr.ph4.split.us.new.preheader_crit_edge ], [ 0, %.lr.ph4.split.us.new.preheader.preheader ]
  %3 = trunc i64 %indvars.iv16 to i32
  %4 = srem i32 %3, 2100
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 2.100000e+03
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv16
  store double %6, double* %7, align 8
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge, %.lr.ph4.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge ], [ 0, %.lr.ph4.split.us.new.preheader ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = mul nsw i64 %indvars.iv.next, %indvars.iv16
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2100
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = mul nsw i64 %indvars.iv.next.1, %indvars.iv16
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 2100
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 2.100000e+03, double 2.100000e+03>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond22.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond22.1, label %._crit_edge.us, label %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge

.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge: ; preds = %.lr.ph4.split.us.new
  br label %.lr.ph4.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph4.split.us.new
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %21 = icmp slt i64 %indvars.iv.next17, 2100
  br i1 %21, label %._crit_edge.us..lr.ph4.split.us.new.preheader_crit_edge, label %.preheader._crit_edge

._crit_edge.us..lr.ph4.split.us.new.preheader_crit_edge: ; preds = %._crit_edge.us
  br label %.lr.ph4.split.us.new.preheader

.lr.ph10.new:                                     ; preds = %.lr.ph10.new..lr.ph10.new_crit_edge, %.lr.ph10.new.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %.lr.ph10.new..lr.ph10.new_crit_edge ], [ 0, %.lr.ph10.new.preheader ]
  %22 = trunc i64 %indvars.iv20 to i32
  %23 = srem i32 %22, 1900
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv20
  %26 = or i32 %22, 1
  %27 = srem i32 %26, 1900
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %24, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 1.900000e+03, double 1.900000e+03>
  %32 = bitcast double* %25 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %33 = icmp slt i64 %indvars.iv.next21.1, 1900
  br i1 %33, label %.lr.ph10.new..lr.ph10.new_crit_edge, label %.lr.ph4.split.us.new.preheader.preheader

.lr.ph10.new..lr.ph10.new_crit_edge:              ; preds = %.lr.ph10.new
  br label %.lr.ph10.new

.lr.ph4.split.us.new.preheader.preheader:         ; preds = %.lr.ph10.new
  br label %.lr.ph4.split.us.new.preheader

.preheader._crit_edge:                            ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double*, double* nocapture readonly, double*) unnamed_addr #2 {
.prol.preheader.preheader:
  %scevgep2324 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2324, i8 0, i64 15200, i32 8, i1 false)
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next20.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter28 = phi i64 [ %prol.iter28.sub, %.prol.preheader..prol.preheader_crit_edge ], [ 4, %.prol.preheader.preheader ]
  %indvars.iv.next20.prol = add nsw i64 %indvars.iv19.prol, 1
  %prol.iter28.sub = add i64 %prol.iter28, -1
  %prol.iter28.cmp = icmp eq i64 %prol.iter28.sub, 0
  br i1 %prol.iter28.cmp, label %.lr.ph9.new.preheader, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.preheader
  %5 = add i64 %indvars.iv19.prol, 9
  %6 = icmp sgt i64 %5, 1900
  %smax = select i1 %6, i64 %5, i64 1900
  %7 = add nsw i64 %smax, -1
  %8 = sub i64 %7, %indvars.iv.next20.prol
  %9 = lshr i64 %8, 3
  %10 = add nuw nsw i64 %9, 1
  %xtraiter = and i64 %10, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph9.new.preheader..lr.ph9.new.prol.loopexit_crit_edge, label %.lr.ph9.new.prol.preheader

.lr.ph9.new.preheader..lr.ph9.new.prol.loopexit_crit_edge: ; preds = %.lr.ph9.new.preheader
  br label %.lr.ph9.new.prol.loopexit

.lr.ph9.new.prol.preheader:                       ; preds = %.lr.ph9.new.preheader
  br label %.lr.ph9.new.prol

.lr.ph9.new.prol:                                 ; preds = %.lr.ph9.new.prol..lr.ph9.new.prol_crit_edge, %.lr.ph9.new.prol.preheader
  %indvars.iv19.prol41 = phi i64 [ %indvars.iv.next20.7.prol, %.lr.ph9.new.prol..lr.ph9.new.prol_crit_edge ], [ %indvars.iv.next20.prol, %.lr.ph9.new.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph9.new.prol..lr.ph9.new.prol_crit_edge ], [ %xtraiter, %.lr.ph9.new.prol.preheader ]
  %indvars.iv.next20.7.prol = add nsw i64 %indvars.iv19.prol41, 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph9.new.prol.loopexit.unr-lcssa, label %.lr.ph9.new.prol..lr.ph9.new.prol_crit_edge, !llvm.loop !3

.lr.ph9.new.prol..lr.ph9.new.prol_crit_edge:      ; preds = %.lr.ph9.new.prol
  br label %.lr.ph9.new.prol

.lr.ph9.new.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph9.new.prol
  br label %.lr.ph9.new.prol.loopexit

.lr.ph9.new.prol.loopexit:                        ; preds = %.lr.ph9.new.preheader..lr.ph9.new.prol.loopexit_crit_edge, %.lr.ph9.new.prol.loopexit.unr-lcssa
  %indvars.iv19.unr = phi i64 [ %indvars.iv.next20.prol, %.lr.ph9.new.preheader..lr.ph9.new.prol.loopexit_crit_edge ], [ %indvars.iv.next20.7.prol, %.lr.ph9.new.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %8, 56
  br i1 %11, label %.lr.ph9.new.prol.loopexit..lr.ph3.split.us.preheader_crit_edge, label %.lr.ph9.new.preheader.new

.lr.ph9.new.prol.loopexit..lr.ph3.split.us.preheader_crit_edge: ; preds = %.lr.ph9.new.prol.loopexit
  br label %.lr.ph3.split.us.preheader

.lr.ph9.new.preheader.new:                        ; preds = %.lr.ph9.new.prol.loopexit
  br label %.lr.ph9.new

.lr.ph3.split.us.preheader.unr-lcssa:             ; preds = %.lr.ph9.new
  br label %.lr.ph3.split.us.preheader

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph9.new.prol.loopexit..lr.ph3.split.us.preheader_crit_edge, %.lr.ph3.split.us.preheader.unr-lcssa
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr37 = ptrtoint double* %2 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us..lr.ph3.split.us_crit_edge, %.lr.ph3.split.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us..lr.ph3.split.us_crit_edge ]
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv15
  store double 0.000000e+00, double* %12, align 8
  %sunkaddr34 = shl i64 %indvars.iv15, 3
  %sunkaddr35 = add i64 %sunkaddr, %sunkaddr34
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to double*
  %sunkaddr39 = add i64 %sunkaddr37, %sunkaddr34
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.._crit_edge30_crit_edge, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge30.._crit_edge30_crit_edge ]
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = load double, double* %sunkaddr36, align 8
  %16 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %14, %18
  store double %19, double* %13, align 8
  %20 = load double, double* %sunkaddr40, align 8
  %21 = load double, double* %16, align 8
  %22 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %20, %24
  store double %25, double* %sunkaddr40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = icmp slt i64 %indvars.iv.next, 1900
  br i1 %26, label %._crit_edge30.._crit_edge30_crit_edge, label %._crit_edge.us

._crit_edge30.._crit_edge30_crit_edge:            ; preds = %._crit_edge30
  br label %._crit_edge30

._crit_edge.us:                                   ; preds = %._crit_edge30
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %27 = icmp slt i64 %indvars.iv.next16, 2100
  br i1 %27, label %._crit_edge.us..lr.ph3.split.us_crit_edge, label %.preheader._crit_edge

._crit_edge.us..lr.ph3.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph3.split.us

.lr.ph9.new:                                      ; preds = %.lr.ph9.new..lr.ph9.new_crit_edge, %.lr.ph9.new.preheader.new
  %indvars.iv19 = phi i64 [ %indvars.iv19.unr, %.lr.ph9.new.preheader.new ], [ %indvars.iv.next20.7.7, %.lr.ph9.new..lr.ph9.new_crit_edge ]
  %indvars.iv.next20.7.7 = add nsw i64 %indvars.iv19, 64
  %28 = icmp slt i64 %indvars.iv.next20.7.7, 1900
  br i1 %28, label %.lr.ph9.new..lr.ph9.new_crit_edge, label %.lr.ph3.split.us.preheader.unr-lcssa

.lr.ph9.new..lr.ph9.new_crit_edge:                ; preds = %.lr.ph9.new
  br label %.lr.ph9.new

.preheader._crit_edge:                            ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph6:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge14.._crit_edge15_crit_edge, %.lr.ph6
  %indvars.iv11 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next12, %._crit_edge14.._crit_edge15_crit_edge ]
  %6 = trunc i64 %indvars.iv11 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge15.._crit_edge14_crit_edge

._crit_edge15.._crit_edge14_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge14

; <label>:9:                                      ; preds = %._crit_edge15
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge15.._crit_edge14_crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv11
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %15 = icmp slt i64 %indvars.iv.next12, 1900
  br i1 %15, label %._crit_edge14.._crit_edge15_crit_edge, label %.lr.ph

._crit_edge14.._crit_edge15_crit_edge:            ; preds = %._crit_edge14
  br label %._crit_edge15

.lr.ph:                                           ; preds = %._crit_edge14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge17.._crit_edge18_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge17.._crit_edge18_crit_edge ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %._crit_edge18.._crit_edge17_crit_edge

._crit_edge18.._crit_edge17_crit_edge:            ; preds = %._crit_edge18
  br label %._crit_edge17

; <label>:23:                                     ; preds = %._crit_edge18
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #6
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge18.._crit_edge17_crit_edge, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %29 = icmp slt i64 %indvars.iv.next, 2100
  br i1 %29, label %._crit_edge17.._crit_edge18_crit_edge, label %._crit_edge16

._crit_edge17.._crit_edge18_crit_edge:            ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge16:                                    ; preds = %._crit_edge17
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #6
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
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

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
!3 = distinct !{!3, !2}
