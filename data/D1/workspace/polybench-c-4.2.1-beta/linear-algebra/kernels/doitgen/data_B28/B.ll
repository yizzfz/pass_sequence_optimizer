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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph29, label %._crit_edge30

.lr.ph29:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %0 to i64
  %12 = zext i32 %2 to i64
  %13 = add nsw i64 %12, -1
  %xtraiter84 = and i64 %12, 3
  %lcmp.mod85 = icmp eq i64 %xtraiter84, 0
  %14 = icmp ult i64 %13, 3
  %wide.trip.count76 = zext i32 %1 to i64
  %15 = add nsw i64 %wide.trip.count76, -1
  %xtraiter91 = and i64 %10, 1
  %lcmp.mod92 = icmp eq i64 %xtraiter91, 0
  %16 = icmp eq i32 %2, 1
  %xtraiter = and i64 %wide.trip.count76, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %15, 7
  br label %18

; <label>:18:                                     ; preds = %._crit_edge21, %.lr.ph29
  %indvars.iv78 = phi i64 [ 0, %.lr.ph29 ], [ %indvars.iv.next79, %._crit_edge21 ]
  br i1 %8, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %18
  br i1 %9, label %.lr.ph20.split.us.preheader, label %.lr.ph20.split.preheader

.lr.ph20.split.preheader:                         ; preds = %.lr.ph20
  br i1 %lcmp.mod, label %.lr.ph20.split.prol.loopexit, label %.lr.ph20.split.prol.preheader

.lr.ph20.split.prol.preheader:                    ; preds = %.lr.ph20.split.preheader
  br label %.lr.ph20.split.prol

.lr.ph20.split.prol:                              ; preds = %.lr.ph20.split.prol, %.lr.ph20.split.prol.preheader
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %.lr.ph20.split.prol ], [ 0, %.lr.ph20.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph20.split.prol ], [ %xtraiter, %.lr.ph20.split.prol.preheader ]
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph20.split.prol.loopexit.unr-lcssa, label %.lr.ph20.split.prol, !llvm.loop !1

.lr.ph20.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph20.split.prol
  br label %.lr.ph20.split.prol.loopexit

.lr.ph20.split.prol.loopexit:                     ; preds = %.lr.ph20.split.preheader, %.lr.ph20.split.prol.loopexit.unr-lcssa
  %indvars.iv56.unr = phi i64 [ 0, %.lr.ph20.split.preheader ], [ %indvars.iv.next57.prol, %.lr.ph20.split.prol.loopexit.unr-lcssa ]
  br i1 %17, label %._crit_edge21.loopexit90, label %.lr.ph20.split.preheader.new

.lr.ph20.split.preheader.new:                     ; preds = %.lr.ph20.split.prol.loopexit
  br label %.lr.ph20.split

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph20.split.us.preheader, %._crit_edge17.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge17.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 0
  br label %.lr.ph.us.us

.lr.ph16.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod85, label %.prol.loopexit83, label %.prol.preheader82.preheader

.prol.preheader82.preheader:                      ; preds = %.lr.ph16.us
  br label %.prol.preheader82

.prol.preheader82:                                ; preds = %.prol.preheader82.preheader, %.prol.preheader82
  %indvars.iv70.prol = phi i64 [ %indvars.iv.next71.prol, %.prol.preheader82 ], [ 0, %.prol.preheader82.preheader ]
  %prol.iter86 = phi i64 [ %prol.iter86.sub, %.prol.preheader82 ], [ %xtraiter84, %.prol.preheader82.preheader ]
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv70.prol
  %21 = bitcast double* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv70.prol
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next71.prol = add nuw nsw i64 %indvars.iv70.prol, 1
  %prol.iter86.sub = add nsw i64 %prol.iter86, -1
  %prol.iter86.cmp = icmp eq i64 %prol.iter86.sub, 0
  br i1 %prol.iter86.cmp, label %.prol.loopexit83.loopexit, label %.prol.preheader82, !llvm.loop !3

.prol.loopexit83.loopexit:                        ; preds = %.prol.preheader82
  br label %.prol.loopexit83

.prol.loopexit83:                                 ; preds = %.prol.loopexit83.loopexit, %.lr.ph16.us
  %indvars.iv70.unr = phi i64 [ 0, %.lr.ph16.us ], [ %xtraiter84, %.prol.loopexit83.loopexit ]
  br i1 %14, label %._crit_edge17.us, label %.lr.ph16.us.new.preheader

.lr.ph16.us.new.preheader:                        ; preds = %.prol.loopexit83
  br label %.lr.ph16.us.new

.lr.ph16.us.new:                                  ; preds = %.lr.ph16.us.new.preheader, %.lr.ph16.us.new
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.3, %.lr.ph16.us.new ], [ %indvars.iv70.unr, %.lr.ph16.us.new.preheader ]
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv70
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv70
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, 2
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71.1
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71.1
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next71.2 = add nsw i64 %indvars.iv70, 3
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71.2
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71.2
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next71.3 = add nuw nsw i64 %indvars.iv70, 4
  %exitcond73.3 = icmp eq i64 %indvars.iv.next71.3, %12
  br i1 %exitcond73.3, label %._crit_edge17.us.loopexit, label %.lr.ph16.us.new

._crit_edge17.us.loopexit:                        ; preds = %.lr.ph16.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %.prol.loopexit83
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph20.split.us, %._crit_edge.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge.us.us ], [ 0, %.lr.ph20.split.us ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv66
  store double 0.000000e+00, double* %45, align 8
  br i1 %lcmp.mod92, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %46

; <label>:46:                                     ; preds = %.prol.preheader
  %47 = load double, double* %19, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv66
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %50, 0.000000e+00
  store double %51, double* %45, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph.us.us, %46
  %.unr.ph = phi double [ %51, %46 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv64.unr.ph = phi i64 [ 1, %46 ], [ 0, %.lr.ph.us.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %16, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit
  br label %52

._crit_edge.us.us.unr-lcssa:                      ; preds = %52
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %12
  br i1 %exitcond69, label %.lr.ph16.us, label %.lr.ph.us.us

; <label>:52:                                     ; preds = %52, %.lr.ph.us.us.new
  %53 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %65, %52 ]
  %indvars.iv64 = phi i64 [ %indvars.iv64.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next65.1, %52 ]
  %54 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv64
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv66
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %58, %53
  store double %59, double* %45, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next65
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next65, i64 %indvars.iv66
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %64, %59
  store double %65, double* %45, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next65.1, %10
  br i1 %exitcond.1, label %._crit_edge.us.us.unr-lcssa, label %52

.lr.ph20.split:                                   ; preds = %.lr.ph20.split, %.lr.ph20.split.preheader.new
  %indvars.iv56 = phi i64 [ %indvars.iv56.unr, %.lr.ph20.split.preheader.new ], [ %indvars.iv.next57.7, %.lr.ph20.split ]
  %indvars.iv.next57.7 = add nsw i64 %indvars.iv56, 8
  %exitcond59.7 = icmp eq i64 %indvars.iv.next57.7, %wide.trip.count76
  br i1 %exitcond59.7, label %._crit_edge21.loopexit90.unr-lcssa, label %.lr.ph20.split

._crit_edge21.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge21

._crit_edge21.loopexit90.unr-lcssa:               ; preds = %.lr.ph20.split
  br label %._crit_edge21.loopexit90

._crit_edge21.loopexit90:                         ; preds = %.lr.ph20.split.prol.loopexit, %._crit_edge21.loopexit90.unr-lcssa
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit90, %._crit_edge21.loopexit, %18
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next79, %11
  br i1 %exitcond89, label %._crit_edge30.loopexit, label %18

._crit_edge30.loopexit:                           ; preds = %._crit_edge21
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %11
  tail call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %15

; <label>:15:                                     ; preds = %11, %14, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph27:
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %._crit_edge21.us, %.lr.ph27
  %indvars.iv63 = phi i64 [ 0, %.lr.ph27 ], [ %indvars.iv.next64, %._crit_edge21.us ]
  br label %.lr.ph15.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next64, 150
  br i1 %exitcond2, label %.lr.ph8.split.us.preheader, label %.lr.ph27.split.us

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge21.us
  br label %.lr.ph8.split.us

.lr.ph15.us.us:                                   ; preds = %.lr.ph27.split.us, %._crit_edge16.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge16.us.us ], [ 0, %.lr.ph27.split.us ]
  %2 = mul nuw nsw i64 %indvars.iv59, %indvars.iv63
  br label %3

._crit_edge16.us.us:                              ; preds = %3
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 140
  br i1 %exitcond62, label %._crit_edge21.us, label %.lr.ph15.us.us

; <label>:3:                                      ; preds = %3, %.lr.ph15.us.us
  %indvars.iv55 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next56.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv55
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv55
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next56
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, 160
  br i1 %exitcond58.1, label %._crit_edge16.us.us, label %3

.lr.ph8.split.us:                                 ; preds = %.lr.ph8.split.us.preheader, %._crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.lr.ph8.split.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph8.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv52, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv52, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next53, 160
  br i1 %exitcond1, label %._crit_edge9, label %.lr.ph8.split.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph12:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge6.us, %.lr.ph12
  %indvars.iv39 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %5 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge13, label %.lr.ph12.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph12.split.us, %._crit_edge.us.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us.us ], [ 0, %.lr.ph12.split.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv35
  %7 = mul nuw nsw i64 %6, 160
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %.lr.ph.us.us

; <label>:8:                                      ; preds = %15, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.lr.ph.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge.us.us, label %8

._crit_edge13:                                    ; preds = %._crit_edge6.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
