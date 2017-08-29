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
  br i1 %6, label %.lr.ph10, label %.preheader

.lr.ph10:                                         ; preds = %5
  %7 = sitofp i32 %0 to double
  %xtraiter30 = and i32 %0, 1
  %lcmp.mod31 = icmp eq i32 %xtraiter30, 0
  br i1 %lcmp.mod31, label %.prol.loopexit29, label %.prol.preheader28

.prol.preheader28:                                ; preds = %.lr.ph10
  %8 = fdiv double 0.000000e+00, %7
  store double %8, double* %4, align 8
  br label %.prol.loopexit29

.prol.loopexit29:                                 ; preds = %.lr.ph10, %.prol.preheader28
  %indvars.iv24.unr = phi i64 [ 0, %.lr.ph10 ], [ 1, %.prol.preheader28 ]
  %9 = icmp eq i32 %0, 1
  br i1 %9, label %.preheader, label %.lr.ph10.new.preheader

.lr.ph10.new.preheader:                           ; preds = %.prol.loopexit29
  %wide.trip.count26 = zext i32 %0 to i64
  %10 = add nsw i64 %wide.trip.count26, -2
  %11 = sub nsw i64 %10, %indvars.iv24.unr
  %12 = lshr i64 %11, 1
  %13 = and i64 %12, 1
  %lcmp.mod43 = icmp eq i64 %13, 0
  br i1 %lcmp.mod43, label %.lr.ph10.new.prol.preheader, label %.lr.ph10.new.prol.loopexit

.lr.ph10.new.prol.preheader:                      ; preds = %.lr.ph10.new.preheader
  br label %.lr.ph10.new.prol

.lr.ph10.new.prol:                                ; preds = %.lr.ph10.new.prol.preheader
  %14 = trunc i64 %indvars.iv24.unr to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv24.unr
  %indvars.iv.next25.prol = add nuw nsw i64 %indvars.iv24.unr, 1
  %17 = trunc i64 %indvars.iv.next25.prol to i32
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %7, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %15, i32 0
  %22 = insertelement <2 x double> %21, double %18, i32 1
  %23 = fdiv <2 x double> %22, %20
  %24 = bitcast double* %16 to <2 x double>*
  store <2 x double> %23, <2 x double>* %24, align 8
  %indvars.iv.next25.1.prol = or i64 %indvars.iv24.unr, 2
  br label %.lr.ph10.new.prol.loopexit

.lr.ph10.new.prol.loopexit:                       ; preds = %.lr.ph10.new.prol, %.lr.ph10.new.preheader
  %indvars.iv24.unr44 = phi i64 [ %indvars.iv24.unr, %.lr.ph10.new.preheader ], [ %indvars.iv.next25.1.prol, %.lr.ph10.new.prol ]
  %25 = icmp eq i64 %12, 0
  br i1 %25, label %.preheader.loopexit, label %.lr.ph10.new.preheader.new

.lr.ph10.new.preheader.new:                       ; preds = %.lr.ph10.new.prol.loopexit
  %26 = insertelement <2 x double> undef, double %7, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %7, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph10.new

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph10.new
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph10.new.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit29, %5
  %30 = icmp sgt i32 %1, 0
  br i1 %30, label %.lr.ph6, label %._crit_edge7

.lr.ph6:                                          ; preds = %.preheader
  %31 = sitofp i32 %1 to double
  br i1 %6, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %32 = icmp eq i32 %0, 1
  %wide.trip.count16 = zext i32 %1 to i64
  %wide.trip.count12 = zext i32 %0 to i64
  %33 = insertelement <2 x double> undef, double %31, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph6.split.us

.lr.ph6.split.preheader:                          ; preds = %.lr.ph6
  %xtraiter22 = and i32 %1, 1
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  br i1 %lcmp.mod23, label %.lr.ph6.split.prol.loopexit, label %.lr.ph6.split.prol.preheader

.lr.ph6.split.prol.preheader:                     ; preds = %.lr.ph6.split.preheader
  %35 = fdiv double 0.000000e+00, %31
  store double %35, double* %3, align 8
  br label %.lr.ph6.split.prol.loopexit

.lr.ph6.split.prol.loopexit:                      ; preds = %.lr.ph6.split.preheader, %.lr.ph6.split.prol.preheader
  %indvars.iv18.unr = phi i64 [ 0, %.lr.ph6.split.preheader ], [ 1, %.lr.ph6.split.prol.preheader ]
  %36 = icmp eq i32 %1, 1
  br i1 %36, label %._crit_edge7, label %.lr.ph6.split.preheader32

.lr.ph6.split.preheader32:                        ; preds = %.lr.ph6.split.prol.loopexit
  %wide.trip.count20 = zext i32 %1 to i64
  %37 = add nsw i64 %wide.trip.count20, -2
  %38 = sub nsw i64 %37, %indvars.iv18.unr
  %39 = lshr i64 %38, 1
  %40 = and i64 %39, 1
  %lcmp.mod39 = icmp eq i64 %40, 0
  br i1 %lcmp.mod39, label %.lr.ph6.split.prol.preheader36, label %.lr.ph6.split.prol.loopexit37

.lr.ph6.split.prol.preheader36:                   ; preds = %.lr.ph6.split.preheader32
  br label %.lr.ph6.split.prol

.lr.ph6.split.prol:                               ; preds = %.lr.ph6.split.prol.preheader36
  %41 = trunc i64 %indvars.iv18.unr to i32
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv18.unr
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.unr, 1
  %44 = trunc i64 %indvars.iv.next19.prol to i32
  %45 = sitofp i32 %44 to double
  %46 = insertelement <2 x double> undef, double %31, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = fdiv <2 x double> %49, %47
  %51 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %indvars.iv.next19.1.prol = or i64 %indvars.iv18.unr, 2
  br label %.lr.ph6.split.prol.loopexit37

.lr.ph6.split.prol.loopexit37:                    ; preds = %.lr.ph6.split.prol, %.lr.ph6.split.preheader32
  %indvars.iv18.unr40 = phi i64 [ %indvars.iv18.unr, %.lr.ph6.split.preheader32 ], [ %indvars.iv.next19.1.prol, %.lr.ph6.split.prol ]
  %52 = icmp eq i64 %39, 0
  br i1 %52, label %._crit_edge7.loopexit35, label %.lr.ph6.split.preheader32.new

.lr.ph6.split.preheader32.new:                    ; preds = %.lr.ph6.split.prol.loopexit37
  %53 = insertelement <2 x double> undef, double %31, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = insertelement <2 x double> undef, double %31, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph6.split

.lr.ph6.split.us:                                 ; preds = %.lr.ph6.split.us.preheader, %._crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge.us ], [ 0, %.lr.ph6.split.us.preheader ]
  %57 = trunc i64 %indvars.iv14 to i32
  %58 = sitofp i32 %57 to double
  %59 = fdiv double %58, %31
  %60 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  store double %59, double* %60, align 8
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph6.split.us
  %61 = srem i32 %57, %1
  %62 = sitofp i32 %61 to double
  %63 = fdiv double %62, %31
  %64 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv14, i64 0
  store double %63, double* %64, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph6.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph6.split.us ]
  br i1 %32, label %._crit_edge.us, label %.lr.ph6.split.us.new.preheader

.lr.ph6.split.us.new.preheader:                   ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph6.split.us.new

.lr.ph6.split.us.new:                             ; preds = %.lr.ph6.split.us.new.preheader, %.lr.ph6.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph6.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph6.split.us.new.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv14
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, %1
  %68 = sitofp i32 %67 to double
  %69 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %70 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv14
  %71 = trunc i64 %70 to i32
  %72 = srem i32 %71, %1
  %73 = sitofp i32 %72 to double
  %74 = insertelement <2 x double> undef, double %68, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fdiv <2 x double> %75, %34
  %77 = bitcast double* %69 to <2 x double>*
  store <2 x double> %76, <2 x double>* %77, align 8
  %exitcond13.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count12
  br i1 %exitcond13.1, label %._crit_edge.us.loopexit, label %.lr.ph6.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit.unr-lcssa
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge7.loopexit, label %.lr.ph6.split.us

.lr.ph10.new:                                     ; preds = %.lr.ph10.new, %.lr.ph10.new.preheader.new
  %indvars.iv24 = phi i64 [ %indvars.iv24.unr44, %.lr.ph10.new.preheader.new ], [ %indvars.iv.next25.1.1, %.lr.ph10.new ]
  %78 = trunc i64 %indvars.iv24 to i32
  %79 = sitofp i32 %78 to double
  %80 = getelementptr inbounds double, double* %4, i64 %indvars.iv24
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %81 = trunc i64 %indvars.iv.next25 to i32
  %82 = sitofp i32 %81 to double
  %83 = insertelement <2 x double> undef, double %79, i32 0
  %84 = insertelement <2 x double> %83, double %82, i32 1
  %85 = fdiv <2 x double> %84, %27
  %86 = bitcast double* %80 to <2 x double>*
  store <2 x double> %85, <2 x double>* %86, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %87 = trunc i64 %indvars.iv.next25.1 to i32
  %88 = sitofp i32 %87 to double
  %89 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next25.1
  %indvars.iv.next25.145 = add nsw i64 %indvars.iv24, 3
  %90 = trunc i64 %indvars.iv.next25.145 to i32
  %91 = sitofp i32 %90 to double
  %92 = insertelement <2 x double> undef, double %88, i32 0
  %93 = insertelement <2 x double> %92, double %91, i32 1
  %94 = fdiv <2 x double> %93, %29
  %95 = bitcast double* %89 to <2 x double>*
  store <2 x double> %94, <2 x double>* %95, align 8
  %indvars.iv.next25.1.1 = add nsw i64 %indvars.iv24, 4
  %exitcond27.1.1 = icmp eq i64 %indvars.iv.next25.1.1, %wide.trip.count26
  br i1 %exitcond27.1.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph10.new

.lr.ph6.split:                                    ; preds = %.lr.ph6.split, %.lr.ph6.split.preheader32.new
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr40, %.lr.ph6.split.preheader32.new ], [ %indvars.iv.next19.1.1, %.lr.ph6.split ]
  %96 = trunc i64 %indvars.iv18 to i32
  %97 = sitofp i32 %96 to double
  %98 = getelementptr inbounds double, double* %3, i64 %indvars.iv18
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %99 = trunc i64 %indvars.iv.next19 to i32
  %100 = sitofp i32 %99 to double
  %101 = insertelement <2 x double> undef, double %97, i32 0
  %102 = insertelement <2 x double> %101, double %100, i32 1
  %103 = fdiv <2 x double> %102, %54
  %104 = bitcast double* %98 to <2 x double>*
  store <2 x double> %103, <2 x double>* %104, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %105 = trunc i64 %indvars.iv.next19.1 to i32
  %106 = sitofp i32 %105 to double
  %107 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next19.1
  %indvars.iv.next19.141 = add nsw i64 %indvars.iv18, 3
  %108 = trunc i64 %indvars.iv.next19.141 to i32
  %109 = sitofp i32 %108 to double
  %110 = insertelement <2 x double> undef, double %106, i32 0
  %111 = insertelement <2 x double> %110, double %109, i32 1
  %112 = fdiv <2 x double> %111, %56
  %113 = bitcast double* %107 to <2 x double>*
  store <2 x double> %112, <2 x double>* %113, align 8
  %indvars.iv.next19.1.1 = add nsw i64 %indvars.iv18, 4
  %exitcond21.1.1 = icmp eq i64 %indvars.iv.next19.1.1, %wide.trip.count20
  br i1 %exitcond21.1.1, label %._crit_edge7.loopexit35.unr-lcssa, label %.lr.ph6.split

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit35.unr-lcssa:                ; preds = %.lr.ph6.split
  br label %._crit_edge7.loopexit35

._crit_edge7.loopexit35:                          ; preds = %.lr.ph6.split.prol.loopexit37, %._crit_edge7.loopexit35.unr-lcssa
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit35, %._crit_edge7.loopexit, %.lr.ph6.split.prol.loopexit, %.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32, i32, [1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %8 = bitcast double* %4 to i8*
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph9.preheader, label %.preheader

.lr.ph9.preheader:                                ; preds = %7
  %10 = bitcast double* %3 to i8*
  %11 = add i32 %0, -1
  %12 = zext i32 %11 to i64
  %13 = shl nuw nsw i64 %12, 3
  %14 = add nuw nsw i64 %13, 8
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 %14, i32 8, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %.lr.ph9.preheader, %7
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  br i1 %9, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %wide.trip.count11 = zext i32 %0 to i64
  %wide.trip.count15 = zext i32 %1 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge6

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  store double 0.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  br label %22

; <label>:22:                                     ; preds = %22, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %22 ]
  %23 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = load double, double* %21, align 8
  %26 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %24, %28
  store double %29, double* %23, align 8
  %30 = load double, double* %20, align 8
  %31 = load double, double* %26, align 8
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %30, %34
  store double %35, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge.us, label %22

._crit_edge.us:                                   ; preds = %22
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge6.loopexit, label %.lr.ph5.split.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.lr.ph5.split.preheader, %.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph8.preheader, label %._crit_edge9

.lr.ph8.preheader:                                ; preds = %4
  %wide.trip.count14 = zext i32 %0 to i64
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %.lr.ph8.preheader, %15
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %15 ], [ 0, %.lr.ph8.preheader ]
  %10 = trunc i64 %indvars.iv12 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %.lr.ph8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %.lr.ph8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv12
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  br i1 %exitcond15, label %._crit_edge9.loopexit, label %.lr.ph8

._crit_edge9.loopexit:                            ; preds = %15
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %24 = icmp sgt i32 %1, 0
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge9
  %wide.trip.count10 = zext i32 %1 to i64
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
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, %wide.trip.count10
  br i1 %exitcond11, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %30
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge9
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
