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
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to double*
  %19 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %19, double* %18)
  br label %20

; <label>:20:                                     ; preds = %14, %17, %2
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
  br i1 %6, label %.lr.ph6, label %.preheader

.lr.ph6:                                          ; preds = %5
  %7 = sitofp i32 %0 to double
  %xtraiter26 = and i32 %0, 1
  %lcmp.mod27 = icmp eq i32 %xtraiter26, 0
  br i1 %lcmp.mod27, label %.prol.loopexit25, label %.prol.preheader24

.prol.preheader24:                                ; preds = %.lr.ph6
  %8 = fdiv double 0.000000e+00, %7
  store double %8, double* %4, align 8
  br label %.prol.loopexit25

.prol.loopexit25:                                 ; preds = %.lr.ph6, %.prol.preheader24
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph6 ], [ 1, %.prol.preheader24 ]
  %9 = icmp eq i32 %0, 1
  br i1 %9, label %.preheader, label %.lr.ph6.new.preheader

.lr.ph6.new.preheader:                            ; preds = %.prol.loopexit25
  %wide.trip.count22 = zext i32 %0 to i64
  %10 = add nsw i64 %wide.trip.count22, -2
  %11 = sub nsw i64 %10, %indvars.iv20.unr
  %12 = lshr i64 %11, 1
  %13 = and i64 %12, 1
  %lcmp.mod40 = icmp eq i64 %13, 0
  br i1 %lcmp.mod40, label %.lr.ph6.new.prol.preheader, label %.lr.ph6.new.prol.loopexit

.lr.ph6.new.prol.preheader:                       ; preds = %.lr.ph6.new.preheader
  br label %.lr.ph6.new.prol

.lr.ph6.new.prol:                                 ; preds = %.lr.ph6.new.prol.preheader
  %14 = trunc i64 %indvars.iv20.unr to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv20.unr
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv20.unr, 1
  %17 = trunc i64 %indvars.iv.next21.prol to i32
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %7, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %15, i32 0
  %22 = insertelement <2 x double> %21, double %18, i32 1
  %23 = fdiv <2 x double> %22, %20
  %24 = bitcast double* %16 to <2 x double>*
  store <2 x double> %23, <2 x double>* %24, align 8
  %indvars.iv.next21.1.prol = or i64 %indvars.iv20.unr, 2
  br label %.lr.ph6.new.prol.loopexit

.lr.ph6.new.prol.loopexit:                        ; preds = %.lr.ph6.new.prol, %.lr.ph6.new.preheader
  %indvars.iv20.unr41 = phi i64 [ %indvars.iv20.unr, %.lr.ph6.new.preheader ], [ %indvars.iv.next21.1.prol, %.lr.ph6.new.prol ]
  %25 = icmp eq i64 %12, 0
  br i1 %25, label %.preheader.loopexit, label %.lr.ph6.new.preheader.new

.lr.ph6.new.preheader.new:                        ; preds = %.lr.ph6.new.prol.loopexit
  %26 = insertelement <2 x double> undef, double %7, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %7, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph6.new

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph6.new
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph6.new.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit25, %5
  %30 = icmp sgt i32 %1, 0
  br i1 %30, label %.lr.ph3, label %._crit_edge4

.lr.ph3:                                          ; preds = %.preheader
  %31 = icmp sgt i32 %0, 0
  %32 = sitofp i32 %1 to double
  br i1 %31, label %.lr.ph3.split.us.preheader, label %.lr.ph3.split.preheader

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %33 = icmp eq i32 %0, 1
  %wide.trip.count12 = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  %34 = insertelement <2 x double> undef, double %32, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph3.split.us

.lr.ph3.split.preheader:                          ; preds = %.lr.ph3
  %xtraiter18 = and i32 %1, 1
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  br i1 %lcmp.mod19, label %.lr.ph3.split.prol.loopexit, label %.lr.ph3.split.prol.preheader

.lr.ph3.split.prol.preheader:                     ; preds = %.lr.ph3.split.preheader
  %36 = fdiv double 0.000000e+00, %32
  store double %36, double* %3, align 8
  br label %.lr.ph3.split.prol.loopexit

.lr.ph3.split.prol.loopexit:                      ; preds = %.lr.ph3.split.preheader, %.lr.ph3.split.prol.preheader
  %indvars.iv14.unr = phi i64 [ 0, %.lr.ph3.split.preheader ], [ 1, %.lr.ph3.split.prol.preheader ]
  %37 = icmp eq i32 %1, 1
  br i1 %37, label %._crit_edge4, label %.lr.ph3.split.preheader28

.lr.ph3.split.preheader28:                        ; preds = %.lr.ph3.split.prol.loopexit
  %wide.trip.count16 = zext i32 %1 to i64
  %38 = add nsw i64 %wide.trip.count16, -2
  %39 = sub nsw i64 %38, %indvars.iv14.unr
  %40 = lshr i64 %39, 1
  %41 = and i64 %40, 1
  %lcmp.mod36 = icmp eq i64 %41, 0
  br i1 %lcmp.mod36, label %.lr.ph3.split.prol.preheader33, label %.lr.ph3.split.prol.loopexit34

.lr.ph3.split.prol.preheader33:                   ; preds = %.lr.ph3.split.preheader28
  br label %.lr.ph3.split.prol

.lr.ph3.split.prol:                               ; preds = %.lr.ph3.split.prol.preheader33
  %42 = trunc i64 %indvars.iv14.unr to i32
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds double, double* %3, i64 %indvars.iv14.unr
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv14.unr, 1
  %45 = trunc i64 %indvars.iv.next15.prol to i32
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %32, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = insertelement <2 x double> undef, double %43, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = fdiv <2 x double> %50, %48
  %52 = bitcast double* %44 to <2 x double>*
  store <2 x double> %51, <2 x double>* %52, align 8
  %indvars.iv.next15.1.prol = or i64 %indvars.iv14.unr, 2
  br label %.lr.ph3.split.prol.loopexit34

.lr.ph3.split.prol.loopexit34:                    ; preds = %.lr.ph3.split.prol, %.lr.ph3.split.preheader28
  %indvars.iv14.unr37 = phi i64 [ %indvars.iv14.unr, %.lr.ph3.split.preheader28 ], [ %indvars.iv.next15.1.prol, %.lr.ph3.split.prol ]
  %53 = icmp eq i64 %40, 0
  br i1 %53, label %._crit_edge4.loopexit32, label %.lr.ph3.split.preheader28.new

.lr.ph3.split.preheader28.new:                    ; preds = %.lr.ph3.split.prol.loopexit34
  %54 = insertelement <2 x double> undef, double %32, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = insertelement <2 x double> undef, double %32, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph3.split

.lr.ph3.split.us:                                 ; preds = %.lr.ph3.split.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  %58 = trunc i64 %indvars.iv10 to i32
  %59 = sitofp i32 %58 to double
  %60 = fdiv double %59, %32
  %61 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  store double %60, double* %61, align 8
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph3.split.us
  %62 = srem i32 %58, %1
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %32
  %65 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv10, i64 0
  store double %64, double* %65, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph3.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph3.split.us ]
  br i1 %33, label %._crit_edge.us, label %.lr.ph3.split.us.new.preheader

.lr.ph3.split.us.new.preheader:                   ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph3.split.us.new

.lr.ph3.split.us.new:                             ; preds = %.lr.ph3.split.us.new.preheader, %.lr.ph3.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph3.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph3.split.us.new.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv10
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, %1
  %69 = sitofp i32 %68 to double
  %70 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %71 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv10
  %72 = trunc i64 %71 to i32
  %73 = srem i32 %72, %1
  %74 = sitofp i32 %73 to double
  %75 = insertelement <2 x double> undef, double %69, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fdiv <2 x double> %76, %35
  %78 = bitcast double* %70 to <2 x double>*
  store <2 x double> %77, <2 x double>* %78, align 8
  %exitcond9.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count8
  br i1 %exitcond9.1, label %._crit_edge.us.loopexit, label %.lr.ph3.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph3.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit.unr-lcssa
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %._crit_edge4.loopexit, label %.lr.ph3.split.us

.lr.ph6.new:                                      ; preds = %.lr.ph6.new, %.lr.ph6.new.preheader.new
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr41, %.lr.ph6.new.preheader.new ], [ %indvars.iv.next21.1.1, %.lr.ph6.new ]
  %79 = trunc i64 %indvars.iv20 to i32
  %80 = sitofp i32 %79 to double
  %81 = getelementptr inbounds double, double* %4, i64 %indvars.iv20
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %82 = trunc i64 %indvars.iv.next21 to i32
  %83 = sitofp i32 %82 to double
  %84 = insertelement <2 x double> undef, double %80, i32 0
  %85 = insertelement <2 x double> %84, double %83, i32 1
  %86 = fdiv <2 x double> %85, %27
  %87 = bitcast double* %81 to <2 x double>*
  store <2 x double> %86, <2 x double>* %87, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %88 = trunc i64 %indvars.iv.next21.1 to i32
  %89 = sitofp i32 %88 to double
  %90 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next21.1
  %indvars.iv.next21.142 = add nsw i64 %indvars.iv20, 3
  %91 = trunc i64 %indvars.iv.next21.142 to i32
  %92 = sitofp i32 %91 to double
  %93 = insertelement <2 x double> undef, double %89, i32 0
  %94 = insertelement <2 x double> %93, double %92, i32 1
  %95 = fdiv <2 x double> %94, %29
  %96 = bitcast double* %90 to <2 x double>*
  store <2 x double> %95, <2 x double>* %96, align 8
  %indvars.iv.next21.1.1 = add nsw i64 %indvars.iv20, 4
  %exitcond23.1.1 = icmp eq i64 %indvars.iv.next21.1.1, %wide.trip.count22
  br i1 %exitcond23.1.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph6.new

.lr.ph3.split:                                    ; preds = %.lr.ph3.split, %.lr.ph3.split.preheader28.new
  %indvars.iv14 = phi i64 [ %indvars.iv14.unr37, %.lr.ph3.split.preheader28.new ], [ %indvars.iv.next15.1.1, %.lr.ph3.split ]
  %97 = trunc i64 %indvars.iv14 to i32
  %98 = sitofp i32 %97 to double
  %99 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %100 = trunc i64 %indvars.iv.next15 to i32
  %101 = sitofp i32 %100 to double
  %102 = insertelement <2 x double> undef, double %98, i32 0
  %103 = insertelement <2 x double> %102, double %101, i32 1
  %104 = fdiv <2 x double> %103, %55
  %105 = bitcast double* %99 to <2 x double>*
  store <2 x double> %104, <2 x double>* %105, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %106 = trunc i64 %indvars.iv.next15.1 to i32
  %107 = sitofp i32 %106 to double
  %108 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.1
  %indvars.iv.next15.138 = add nsw i64 %indvars.iv14, 3
  %109 = trunc i64 %indvars.iv.next15.138 to i32
  %110 = sitofp i32 %109 to double
  %111 = insertelement <2 x double> undef, double %107, i32 0
  %112 = insertelement <2 x double> %111, double %110, i32 1
  %113 = fdiv <2 x double> %112, %57
  %114 = bitcast double* %108 to <2 x double>*
  store <2 x double> %113, <2 x double>* %114, align 8
  %indvars.iv.next15.1.1 = add nsw i64 %indvars.iv14, 4
  %exitcond17.1.1 = icmp eq i64 %indvars.iv.next15.1.1, %wide.trip.count16
  br i1 %exitcond17.1.1, label %._crit_edge4.loopexit32.unr-lcssa, label %.lr.ph3.split

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4.loopexit32.unr-lcssa:                ; preds = %.lr.ph3.split
  br label %._crit_edge4.loopexit32

._crit_edge4.loopexit32:                          ; preds = %.lr.ph3.split.prol.loopexit34, %._crit_edge4.loopexit32.unr-lcssa
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit32, %._crit_edge4.loopexit, %.lr.ph3.split.prol.loopexit, %.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32, i32, [1900 x double]* nocapture readonly, double* nocapture, double*, double* nocapture readonly, double*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph9.preheader, label %.preheader

.lr.ph9.preheader:                                ; preds = %7
  %9 = bitcast double* %3 to i8*
  %10 = add i32 %0, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %13, i32 8, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %.lr.ph9.preheader, %7
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph6, label %._crit_edge7

.lr.ph6:                                          ; preds = %.preheader
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  %sunkaddr = ptrtoint double* %6 to i64
  %sunkaddr28 = ptrtoint double* %4 to i64
  %wide.trip.count11 = zext i32 %0 to i64
  %wide.trip.count15 = zext i32 %1 to i64
  br label %.lr.ph6.split.us

.lr.ph6.split.preheader:                          ; preds = %.lr.ph6
  %16 = bitcast double* %4 to i8*
  %17 = add i32 %1, -1
  %18 = zext i32 %17 to i64
  %19 = shl nuw nsw i64 %18, 3
  %20 = add nuw nsw i64 %19, 8
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 %20, i32 8, i1 false)
  br label %._crit_edge7

.lr.ph6.split.us:                                 ; preds = %.lr.ph6.split.us.preheader, %._crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge.us ], [ 0, %.lr.ph6.split.us.preheader ]
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  store double 0.000000e+00, double* %21, align 8
  %sunkaddr25 = shl i64 %indvars.iv13, 3
  %sunkaddr26 = add i64 %sunkaddr, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  %sunkaddr29 = shl i64 %indvars.iv13, 3
  %sunkaddr30 = add i64 %sunkaddr28, %sunkaddr29
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to double*
  br label %22

; <label>:22:                                     ; preds = %22, %.lr.ph6.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph6.split.us ], [ %indvars.iv.next, %22 ]
  %23 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = load double, double* %sunkaddr27, align 8
  %26 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %24, %28
  store double %29, double* %23, align 8
  %30 = load double, double* %sunkaddr31, align 8
  %31 = load double, double* %26, align 8
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %30, %34
  store double %35, double* %sunkaddr31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge.us, label %22

._crit_edge.us:                                   ; preds = %22
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge7.loopexit, label %.lr.ph6.split.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.lr.ph6.split.preheader, %.preheader
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
  br i1 %9, label %.lr.ph6.preheader, label %._crit_edge7

.lr.ph6.preheader:                                ; preds = %4
  %wide.trip.count12 = zext i32 %0 to i64
  br label %.lr.ph6

.lr.ph6:                                          ; preds = %.lr.ph6.preheader, %15
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %15 ], [ 0, %.lr.ph6.preheader ]
  %10 = trunc i64 %indvars.iv10 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %.lr.ph6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %.lr.ph6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %._crit_edge7.loopexit, label %.lr.ph6

._crit_edge7.loopexit:                            ; preds = %15
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %24 = icmp sgt i32 %1, 0
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge7
  %wide.trip.count8 = zext i32 %1 to i64
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
  %exitcond9 = icmp eq i64 %indvars.iv.next, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %30
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge7
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
