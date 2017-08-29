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
  %8 = zext i32 %0 to i64
  %xtraiter30 = and i64 %8, 1
  %lcmp.mod31 = icmp eq i64 %xtraiter30, 0
  br i1 %lcmp.mod31, label %.prol.loopexit29, label %.prol.preheader28

.prol.preheader28:                                ; preds = %.lr.ph10
  %9 = fdiv double 0.000000e+00, %7
  store double %9, double* %4, align 8
  br label %.prol.loopexit29

.prol.loopexit29:                                 ; preds = %.lr.ph10, %.prol.preheader28
  %indvars.iv22.unr = phi i64 [ 0, %.lr.ph10 ], [ 1, %.prol.preheader28 ]
  %10 = icmp eq i32 %0, 1
  br i1 %10, label %.preheader, label %.lr.ph10.new.preheader

.lr.ph10.new.preheader:                           ; preds = %.prol.loopexit29
  %11 = add nsw i64 %8, -2
  %12 = sub nsw i64 %11, %indvars.iv22.unr
  %13 = lshr i64 %12, 1
  %14 = and i64 %13, 1
  %lcmp.mod45 = icmp eq i64 %14, 0
  br i1 %lcmp.mod45, label %.lr.ph10.new.prol.preheader, label %.lr.ph10.new.prol.loopexit

.lr.ph10.new.prol.preheader:                      ; preds = %.lr.ph10.new.preheader
  br label %.lr.ph10.new.prol

.lr.ph10.new.prol:                                ; preds = %.lr.ph10.new.prol.preheader
  %15 = trunc i64 %indvars.iv22.unr to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %4, i64 %indvars.iv22.unr
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.unr, 1
  %18 = trunc i64 %indvars.iv.next23.prol to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %7, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = insertelement <2 x double> undef, double %16, i32 0
  %23 = insertelement <2 x double> %22, double %19, i32 1
  %24 = fdiv <2 x double> %23, %21
  %25 = bitcast double* %17 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next23.1.prol = or i64 %indvars.iv22.unr, 2
  br label %.lr.ph10.new.prol.loopexit

.lr.ph10.new.prol.loopexit:                       ; preds = %.lr.ph10.new.prol, %.lr.ph10.new.preheader
  %indvars.iv22.unr46 = phi i64 [ %indvars.iv22.unr, %.lr.ph10.new.preheader ], [ %indvars.iv.next23.1.prol, %.lr.ph10.new.prol ]
  %26 = icmp eq i64 %13, 0
  br i1 %26, label %.preheader.loopexit, label %.lr.ph10.new.preheader.new

.lr.ph10.new.preheader.new:                       ; preds = %.lr.ph10.new.prol.loopexit
  %27 = insertelement <2 x double> undef, double %7, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = insertelement <2 x double> undef, double %7, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph10.new

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph10.new
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph10.new.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit29, %5
  %31 = icmp sgt i32 %1, 0
  br i1 %31, label %.lr.ph6, label %._crit_edge7

.lr.ph6:                                          ; preds = %.preheader
  %32 = sitofp i32 %1 to double
  br i1 %6, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.preheader:                          ; preds = %.lr.ph6
  %33 = zext i32 %1 to i64
  %xtraiter26 = and i64 %33, 1
  %lcmp.mod27 = icmp eq i64 %xtraiter26, 0
  br i1 %lcmp.mod27, label %.lr.ph6.split.prol.loopexit, label %.lr.ph6.split.prol.preheader

.lr.ph6.split.prol.preheader:                     ; preds = %.lr.ph6.split.preheader
  %34 = fdiv double 0.000000e+00, %32
  store double %34, double* %3, align 8
  br label %.lr.ph6.split.prol.loopexit

.lr.ph6.split.prol.loopexit:                      ; preds = %.lr.ph6.split.preheader, %.lr.ph6.split.prol.preheader
  %indvars.iv18.unr = phi i64 [ 0, %.lr.ph6.split.preheader ], [ 1, %.lr.ph6.split.prol.preheader ]
  %35 = icmp eq i32 %1, 1
  br i1 %35, label %._crit_edge7, label %.lr.ph6.split.preheader36

.lr.ph6.split.preheader36:                        ; preds = %.lr.ph6.split.prol.loopexit
  %36 = add nsw i64 %33, -2
  %37 = sub nsw i64 %36, %indvars.iv18.unr
  %38 = lshr i64 %37, 1
  %39 = and i64 %38, 1
  %lcmp.mod41 = icmp eq i64 %39, 0
  br i1 %lcmp.mod41, label %.lr.ph6.split.prol.preheader38, label %.lr.ph6.split.prol.loopexit39

.lr.ph6.split.prol.preheader38:                   ; preds = %.lr.ph6.split.preheader36
  br label %.lr.ph6.split.prol

.lr.ph6.split.prol:                               ; preds = %.lr.ph6.split.prol.preheader38
  %40 = trunc i64 %indvars.iv18.unr to i32
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv18.unr
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.unr, 1
  %43 = trunc i64 %indvars.iv.next19.prol to i32
  %44 = sitofp i32 %43 to double
  %45 = insertelement <2 x double> undef, double %32, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = insertelement <2 x double> undef, double %41, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = fdiv <2 x double> %48, %46
  %50 = bitcast double* %42 to <2 x double>*
  store <2 x double> %49, <2 x double>* %50, align 8
  %indvars.iv.next19.1.prol = or i64 %indvars.iv18.unr, 2
  br label %.lr.ph6.split.prol.loopexit39

.lr.ph6.split.prol.loopexit39:                    ; preds = %.lr.ph6.split.prol, %.lr.ph6.split.preheader36
  %indvars.iv18.unr42 = phi i64 [ %indvars.iv18.unr, %.lr.ph6.split.preheader36 ], [ %indvars.iv.next19.1.prol, %.lr.ph6.split.prol ]
  %51 = icmp eq i64 %38, 0
  br i1 %51, label %._crit_edge7.loopexit37, label %.lr.ph6.split.preheader36.new

.lr.ph6.split.preheader36.new:                    ; preds = %.lr.ph6.split.prol.loopexit39
  %52 = insertelement <2 x double> undef, double %32, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = insertelement <2 x double> undef, double %32, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph6.split

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  %56 = zext i32 %0 to i64
  %xtraiter = and i64 %56, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %57 = icmp eq i32 %0, 1
  %wide.trip.count16 = zext i32 %1 to i64
  %58 = insertelement <2 x double> undef, double %32, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph6.split.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.lr.ph6.split.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %60 = trunc i64 %indvars.iv14 to i32
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, %32
  %63 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  store double %62, double* %63, align 8
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph6.split.us
  %64 = srem i32 %60, %1
  %65 = sitofp i32 %64 to double
  %66 = fdiv double %65, %32
  %67 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv14, i64 0
  store double %66, double* %67, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph6.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph6.split.us ]
  br i1 %57, label %._crit_edge.us, label %.lr.ph6.split.us.new.preheader

.lr.ph6.split.us.new.preheader:                   ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph6.split.us.new

.lr.ph6.split.us.new:                             ; preds = %.lr.ph6.split.us.new.preheader, %.lr.ph6.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph6.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph6.split.us.new.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %68 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv14
  %69 = trunc i64 %68 to i32
  %70 = srem i32 %69, %1
  %71 = sitofp i32 %70 to double
  %72 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %73 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv14
  %74 = trunc i64 %73 to i32
  %75 = srem i32 %74, %1
  %76 = sitofp i32 %75 to double
  %77 = insertelement <2 x double> undef, double %71, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fdiv <2 x double> %78, %59
  %80 = bitcast double* %72 to <2 x double>*
  store <2 x double> %79, <2 x double>* %80, align 8
  %exitcond13.1 = icmp eq i64 %indvars.iv.next.1, %56
  br i1 %exitcond13.1, label %._crit_edge.us.loopexit, label %.lr.ph6.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit.unr-lcssa
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge7.loopexit, label %.lr.ph6.split.us

.lr.ph10.new:                                     ; preds = %.lr.ph10.new, %.lr.ph10.new.preheader.new
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr46, %.lr.ph10.new.preheader.new ], [ %indvars.iv.next23.1.1, %.lr.ph10.new ]
  %81 = trunc i64 %indvars.iv22 to i32
  %82 = sitofp i32 %81 to double
  %83 = getelementptr inbounds double, double* %4, i64 %indvars.iv22
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %84 = trunc i64 %indvars.iv.next23 to i32
  %85 = sitofp i32 %84 to double
  %86 = insertelement <2 x double> undef, double %82, i32 0
  %87 = insertelement <2 x double> %86, double %85, i32 1
  %88 = fdiv <2 x double> %87, %28
  %89 = bitcast double* %83 to <2 x double>*
  store <2 x double> %88, <2 x double>* %89, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %90 = trunc i64 %indvars.iv.next23.1 to i32
  %91 = sitofp i32 %90 to double
  %92 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next23.1
  %indvars.iv.next23.147 = add nsw i64 %indvars.iv22, 3
  %93 = trunc i64 %indvars.iv.next23.147 to i32
  %94 = sitofp i32 %93 to double
  %95 = insertelement <2 x double> undef, double %91, i32 0
  %96 = insertelement <2 x double> %95, double %94, i32 1
  %97 = fdiv <2 x double> %96, %30
  %98 = bitcast double* %92 to <2 x double>*
  store <2 x double> %97, <2 x double>* %98, align 8
  %indvars.iv.next23.1.1 = add nsw i64 %indvars.iv22, 4
  %exitcond25.1.1 = icmp eq i64 %indvars.iv.next23.1.1, %8
  br i1 %exitcond25.1.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph10.new

.lr.ph6.split:                                    ; preds = %.lr.ph6.split, %.lr.ph6.split.preheader36.new
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr42, %.lr.ph6.split.preheader36.new ], [ %indvars.iv.next19.1.1, %.lr.ph6.split ]
  %99 = trunc i64 %indvars.iv18 to i32
  %100 = sitofp i32 %99 to double
  %101 = getelementptr inbounds double, double* %3, i64 %indvars.iv18
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %102 = trunc i64 %indvars.iv.next19 to i32
  %103 = sitofp i32 %102 to double
  %104 = insertelement <2 x double> undef, double %100, i32 0
  %105 = insertelement <2 x double> %104, double %103, i32 1
  %106 = fdiv <2 x double> %105, %53
  %107 = bitcast double* %101 to <2 x double>*
  store <2 x double> %106, <2 x double>* %107, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %108 = trunc i64 %indvars.iv.next19.1 to i32
  %109 = sitofp i32 %108 to double
  %110 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next19.1
  %indvars.iv.next19.143 = add nsw i64 %indvars.iv18, 3
  %111 = trunc i64 %indvars.iv.next19.143 to i32
  %112 = sitofp i32 %111 to double
  %113 = insertelement <2 x double> undef, double %109, i32 0
  %114 = insertelement <2 x double> %113, double %112, i32 1
  %115 = fdiv <2 x double> %114, %55
  %116 = bitcast double* %110 to <2 x double>*
  store <2 x double> %115, <2 x double>* %116, align 8
  %indvars.iv.next19.1.1 = add nsw i64 %indvars.iv18, 4
  %exitcond21.1.1 = icmp eq i64 %indvars.iv.next19.1.1, %33
  br i1 %exitcond21.1.1, label %._crit_edge7.loopexit37.unr-lcssa, label %.lr.ph6.split

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit37.unr-lcssa:                ; preds = %.lr.ph6.split
  br label %._crit_edge7.loopexit37

._crit_edge7.loopexit37:                          ; preds = %.lr.ph6.split.prol.loopexit39, %._crit_edge7.loopexit37.unr-lcssa
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit37, %._crit_edge7.loopexit, %.lr.ph6.split.prol.loopexit, %.preheader
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
