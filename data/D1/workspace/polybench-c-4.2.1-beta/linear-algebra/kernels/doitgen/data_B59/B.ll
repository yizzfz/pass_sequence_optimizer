; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph30, label %._crit_edge31

.lr.ph30:                                         ; preds = %6
  %8 = add i32 %2, -1
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %xtraiter76 = and i32 %2, 1
  %lcmp.mod77 = icmp eq i32 %xtraiter76, 0
  %12 = icmp eq i32 %8, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %wide.trip.count65.1 = zext i32 %2 to i64
  %xtraiter84 = and i32 %2, 3
  %lcmp.mod85 = icmp eq i32 %xtraiter84, 0
  %13 = icmp ult i32 %8, 3
  %wide.trip.count57 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter84, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %wide.trip.count57, -1
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count93 = zext i32 %1 to i64
  %xtraiter = and i64 %wide.trip.count57, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %17, 7
  br label %19

; <label>:19:                                     ; preds = %._crit_edge14, %.lr.ph30
  %indvars.iv71 = phi i64 [ 0, %.lr.ph30 ], [ %indvars.iv.next72, %._crit_edge14 ]
  br i1 %10, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %19
  br i1 %11, label %.lr.ph13.split.us.preheader, label %.lr.ph13.split.preheader

.lr.ph13.split.preheader:                         ; preds = %.lr.ph13
  br i1 %lcmp.mod, label %.lr.ph13.split.prol.loopexit, label %.lr.ph13.split.prol.preheader

.lr.ph13.split.prol.preheader:                    ; preds = %.lr.ph13.split.preheader
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol:                              ; preds = %.lr.ph13.split.prol, %.lr.ph13.split.prol.preheader
  %indvars.iv55.prol = phi i64 [ %indvars.iv.next56.prol, %.lr.ph13.split.prol ], [ 0, %.lr.ph13.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph13.split.prol ], [ %xtraiter, %.lr.ph13.split.prol.preheader ]
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.split.prol.loopexit.unr-lcssa, label %.lr.ph13.split.prol, !llvm.loop !1

.lr.ph13.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph13.split.prol
  br label %.lr.ph13.split.prol.loopexit

.lr.ph13.split.prol.loopexit:                     ; preds = %.lr.ph13.split.preheader, %.lr.ph13.split.prol.loopexit.unr-lcssa
  %indvars.iv55.unr = phi i64 [ 0, %.lr.ph13.split.preheader ], [ %indvars.iv.next56.prol, %.lr.ph13.split.prol.loopexit.unr-lcssa ]
  br i1 %18, label %._crit_edge14.loopexit90, label %.lr.ph13.split.preheader.new

.lr.ph13.split.preheader.new:                     ; preds = %.lr.ph13.split.prol.loopexit
  br label %.lr.ph13.split

.lr.ph13.split.us.preheader:                      ; preds = %.lr.ph13
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %._crit_edge10.us, %.lr.ph13.split.us.preheader
  %indvars.iv91 = phi i64 [ 0, %.lr.ph13.split.us.preheader ], [ %indvars.iv.next92, %._crit_edge10.us ]
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv91, i64 0
  br label %.lr.ph.us.us

._crit_edge10.us.loopexit:                        ; preds = %.lr.ph9.us.new
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %.prol.loopexit83
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94, label %._crit_edge14.loopexit, label %.lr.ph13.split.us

.lr.ph9.us.new:                                   ; preds = %.lr.ph9.us.new.preheader, %.lr.ph9.us.new
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.3, %.lr.ph9.us.new ], [ %indvars.iv67.unr, %.lr.ph9.us.new.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv67
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv91, i64 %indvars.iv67
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next68
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv91, i64 %indvars.iv.next68
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next68.1
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv91, i64 %indvars.iv.next68.1
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next68.2 = add nsw i64 %indvars.iv67, 3
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next68.2
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv91, i64 %indvars.iv.next68.2
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next68.3 = add nsw i64 %indvars.iv67, 4
  %exitcond70.3 = icmp eq i64 %indvars.iv.next68.3, %wide.trip.count65.1
  br i1 %exitcond70.3, label %._crit_edge10.us.loopexit, label %.lr.ph9.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph13.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph13.split.us ], [ %indvars.iv.next, %._crit_edge.us.us ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  store double 0.000000e+00, double* %41, align 8
  br i1 %lcmp.mod77, label %.prol.loopexit75, label %.prol.preheader74

.prol.preheader74:                                ; preds = %.lr.ph.us.us
  %42 = load double, double* %20, align 8
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %sunkaddr47.prol = shl nsw i64 %indvars.iv, 3
  %sunkaddr48.prol = add i64 %sunkaddr, %sunkaddr47.prol
  %sunkaddr49.prol = inttoptr i64 %sunkaddr48.prol to double*
  %46 = load double, double* %sunkaddr49.prol, align 8
  %47 = fadd double %45, %46
  store double %47, double* %sunkaddr49.prol, align 8
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.prol.preheader74, %.lr.ph.us.us
  %indvars.iv63.unr.ph = phi i64 [ 1, %.prol.preheader74 ], [ 0, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit75
  %sunkaddr47 = shl nsw i64 %indvars.iv, 3
  %sunkaddr48 = add i64 %sunkaddr, %sunkaddr47
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  %.pre = load double, double* %sunkaddr49, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit75
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.lr.ph9.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %48 = phi double [ %60, %.lr.ph.us.us.new ], [ %.pre, %.lr.ph.us.us.new.preheader ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %.lr.ph.us.us.new ], [ %indvars.iv63.unr.ph, %.lr.ph.us.us.new.preheader ]
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv91, i64 %indvars.iv63
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv63, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %53, %48
  store double %54, double* %sunkaddr49, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv91, i64 %indvars.iv.next64
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next64, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %59, %54
  store double %60, double* %sunkaddr49, align 8
  %indvars.iv.next64.1 = add nuw nsw i64 %indvars.iv63, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next64.1, %wide.trip.count65.1
  br i1 %exitcond66.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph9.us:                                       ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod85, label %.prol.loopexit83, label %.prol.preheader82.preheader

.prol.preheader82.preheader:                      ; preds = %.lr.ph9.us
  br label %.prol.preheader82

.prol.preheader82:                                ; preds = %.prol.preheader82.preheader, %.prol.preheader82
  %indvars.iv67.prol = phi i64 [ %indvars.iv.next68.prol, %.prol.preheader82 ], [ 0, %.prol.preheader82.preheader ]
  %prol.iter86 = phi i32 [ %prol.iter86.sub, %.prol.preheader82 ], [ %xtraiter84, %.prol.preheader82.preheader ]
  %61 = getelementptr inbounds double, double* %5, i64 %indvars.iv67.prol
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv91, i64 %indvars.iv67.prol
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next68.prol = add nuw nsw i64 %indvars.iv67.prol, 1
  %prol.iter86.sub = add nsw i32 %prol.iter86, -1
  %prol.iter86.cmp = icmp eq i32 %prol.iter86.sub, 0
  br i1 %prol.iter86.cmp, label %.prol.loopexit83.loopexit, label %.prol.preheader82, !llvm.loop !3

.prol.loopexit83.loopexit:                        ; preds = %.prol.preheader82
  br label %.prol.loopexit83

.prol.loopexit83:                                 ; preds = %.prol.loopexit83.loopexit, %.lr.ph9.us
  %indvars.iv67.unr = phi i64 [ 0, %.lr.ph9.us ], [ %16, %.prol.loopexit83.loopexit ]
  br i1 %13, label %._crit_edge10.us, label %.lr.ph9.us.new.preheader

.lr.ph9.us.new.preheader:                         ; preds = %.prol.loopexit83
  br label %.lr.ph9.us.new

.lr.ph13.split:                                   ; preds = %.lr.ph13.split, %.lr.ph13.split.preheader.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr, %.lr.ph13.split.preheader.new ], [ %indvars.iv.next56.7, %.lr.ph13.split ]
  %indvars.iv.next56.7 = add nsw i64 %indvars.iv55, 8
  %exitcond58.7 = icmp eq i64 %indvars.iv.next56.7, %wide.trip.count57
  br i1 %exitcond58.7, label %._crit_edge14.loopexit90.unr-lcssa, label %.lr.ph13.split

._crit_edge14.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge14

._crit_edge14.loopexit90.unr-lcssa:               ; preds = %.lr.ph13.split
  br label %._crit_edge14.loopexit90

._crit_edge14.loopexit90:                         ; preds = %.lr.ph13.split.prol.loopexit, %._crit_edge14.loopexit90.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit90, %._crit_edge14.loopexit, %19
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next72, %9
  br i1 %exitcond95, label %._crit_edge31.loopexit, label %19

._crit_edge31.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %11
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %15

; <label>:15:                                     ; preds = %11, %14, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #2 {
.lr.ph21:
  br label %.lr.ph21.split.us

.lr.ph21.split.us:                                ; preds = %._crit_edge15.us, %.lr.ph21
  %indvars.iv66 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next67, %._crit_edge15.us ]
  br label %.lr.ph9.us.us

._crit_edge15.us:                                 ; preds = %._crit_edge10.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next67, 150
  br i1 %exitcond68, label %.lr.ph3.split.us.preheader, label %.lr.ph21.split.us

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge15.us
  br label %.lr.ph3.split.us

.lr.ph9.us.us:                                    ; preds = %._crit_edge10.us.us, %.lr.ph21.split.us
  %indvars.iv63 = phi i64 [ 0, %.lr.ph21.split.us ], [ %indvars.iv.next64, %._crit_edge10.us.us ]
  %5 = mul nuw nsw i64 %indvars.iv63, %indvars.iv66
  br label %6

._crit_edge10.us.us:                              ; preds = %6
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 140
  br i1 %exitcond65, label %._crit_edge15.us, label %.lr.ph9.us.us

; <label>:6:                                      ; preds = %6, %.lr.ph9.us.us
  %indvars.iv55 = phi i64 [ 0, %.lr.ph9.us.us ], [ %indvars.iv.next56.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv55
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv55
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next56
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, 160
  br i1 %exitcond58.1, label %._crit_edge10.us.us, label %6

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv52, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv52, %indvars.iv.next
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 160
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 1.600000e+02, double 1.600000e+02>
  %33 = bitcast double* %25 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %20

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next53, 160
  br i1 %exitcond62, label %._crit_edge4, label %.lr.ph3.split.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #0 {
.lr.ph10:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %._crit_edge4.us, %.lr.ph10
  %indvars.iv42 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next43, %._crit_edge4.us ]
  %8 = mul nuw nsw i64 %indvars.iv42, 140
  br label %.lr.ph.us.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next43, 150
  br i1 %exitcond44, label %._crit_edge11, label %.lr.ph10.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph10.split.us
  %indvars.iv38 = phi i64 [ 0, %.lr.ph10.split.us ], [ %indvars.iv.next39, %._crit_edge.us.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv38
  %10 = mul nuw nsw i64 %9, 160
  %11 = trunc i64 %10 to i32
  br label %12

._crit_edge.us.us:                                ; preds = %19
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 140
  br i1 %exitcond, label %._crit_edge4.us, label %.lr.ph.us.us

; <label>:12:                                     ; preds = %19, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.lr.ph.us.us ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = add nuw nsw i32 %11, %13
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv42, i64 %indvars.iv38, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond36, label %._crit_edge.us.us, label %12

._crit_edge11:                                    ; preds = %._crit_edge4.us
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
